import 'dart:io';

/// Abstract class Person
abstract class Person {
  String name;
  int age;
  String gender;

  Person(this.name, this.age, this.gender);

  void displayInfo(); // abstract method
}

/// Employee class inheriting from Person
class Employee extends Person {
  double _salary;
  String department;

  Employee(String name, this._salary, this.department, int age, String gender)
      : super(name, age, gender);

  double get salary => _salary;

  set salary(double value) {
    if (value >= 0) {
      _salary = value;
    }
  }

  @override
  void displayInfo() {
    print(
        "Employee Name: $name, Salary: $_salary, Department: $department, Age: $age, Gender: $gender");
  }
}

/// Manager class inheriting from Employee
class Manager extends Employee {
  double bonus;

  Manager(String name, double salary, String department, int age, String gender,
      this.bonus)
      : super(name, salary, department, age, gender);

  @override
  void displayInfo() {
    super.displayInfo();
    print("Bonus: $bonus");
  }
}

/// Company class with a static name and employee list
class Company {
  static String companyName = "Shadows";
  static List<Employee> staff = [];

  static void companyInfo() {
    print("Welcome to $companyName!");
  }

  static void addEmployee(Employee emp) {
    staff.add(emp);
    print("✅ Employee added to $companyName.");
  }

  static void showAllStaff() {
    print("\n📋 All Staff:");
    for (var person in staff) {
      person.displayInfo();
      print("----------------------");
    }
  }
}

void main() {
  Company.companyInfo();

  while (true) {
    print("\nDo you want to add an Employee or a Manager? (E/M), or Q to Quit:");
    String userChoice = stdin.readLineSync()!.toUpperCase();

    if (userChoice == 'E') {
      print("\nEnter new employee information:");
      stdout.write("Name: ");
      var empName = stdin.readLineSync()!;
      stdout.write("Salary: ");
      var empSalary = double.parse(stdin.readLineSync()!);
      stdout.write("Department: ");
      var empDepartment = stdin.readLineSync()!;
      stdout.write("Age: ");
      var empAge = int.parse(stdin.readLineSync()!);
      stdout.write("Gender: ");
      var empGender = stdin.readLineSync()!;

      var newEmployee =
      Employee(empName, empSalary, empDepartment, empAge, empGender);
      Company.addEmployee(newEmployee);
    } else if (userChoice == 'M') {
      print("\nEnter new manager information:");
      stdout.write("Name: ");
      var mgrName = stdin.readLineSync()!;
      stdout.write("Salary: ");
      var mgrSalary = double.parse(stdin.readLineSync()!);
      stdout.write("Department: ");
      var mgrDepartment = stdin.readLineSync()!;
      stdout.write("Age: ");
      var mgrAge = int.parse(stdin.readLineSync()!);
      stdout.write("Gender: ");
      var mgrGender = stdin.readLineSync()!;
      stdout.write("Bonus: ");
      var mgrBonus = double.parse(stdin.readLineSync()!);

      var newManager = Manager(
          mgrName, mgrSalary, mgrDepartment, mgrAge, mgrGender, mgrBonus);
      Company.addEmployee(newManager);
    } else if (userChoice == 'Q') {
      print("Exiting...");
      break;
    } else {
      print("❌ Invalid choice. Please choose 'E', 'M', or 'Q'.");
    }
  }

  Company.showAllStaff();
}
