# Employee Management System 👩‍💼👨‍💼

This is a simple **Employee and Manager Management System** built in **Dart**. It allows users to add employees or managers, display their information, and simulate basic company data management through a command-line interface.

---

## 📁 File
- `employee_management_system.dart` — Main Dart source file containing the classes and logic.

---

## 🧱 Features
- Abstract `Person` class to define shared properties.
- `Employee` and `Manager` classes inherit from `Person`.
- `Manager` extends `Employee` and adds bonus info.
- Static `Company` class to store and manage employees.
- Interactive CLI input using `dart:io`.
- OOP principles: encapsulation, inheritance, polymorphism.
- Input validation for salary and age (basic).
- Dynamically stores all added employees and displays them.

---

## 🚀 How to Run
1. Make sure Dart SDK is installed: https://dart.dev/get-dart
2. Clone this repository or download the `.dart` file.
3. Open a terminal and run:


Example output:


Welcome to Shadows!

Do you want to add an Employee or a Manager? (E/M), or Q to Quit:
E
Enter new employee information:
Name: Sarah
Salary: 5000
Department: IT
Age: 25
Gender: Female
✅ Employee added to Shadows.

📋 All Staff:
Employee Name: Sarah, Salary: 5000.0, Department: IT, Age: 25, Gender: Female
----------------------





