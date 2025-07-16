import 'dart:io';

void main() {
  String? numbers= stdin.readLineSync();
  if (numbers!= null &&numbers.isNotEmpty){
    List<String> num= numbers.split(' ');

    List<int> ans= num.map((num)=> int.parse(num)).toList();
   int  red= ans.reduce((a, b)=> a+b);
   print(red);
  }



}
//or you can do this

import 'dart:io';

void main() {
  stdout.write("Enter numbers separated by space: ");
  String? input = stdin.readLineSync();

  if (input != null && input.isNotEmpty) {
    List<int> numbers = input
        .split(' ')
        .map((e) => int.parse(e))
        .toList();

    int sum = numbers.reduce((a, b) => a + b);
    print("Sum = $sum");
  } else {
    print("No input provided.");
  }
}
