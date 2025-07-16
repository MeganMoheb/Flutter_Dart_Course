import 'dart:io';

void main() {
  stdout.write("Enter numbers separated by space: ");
  String? input = stdin.readLineSync();

  if (input != null && input.isNotEmpty) {
    // Step 1: Split input by space
    List<String> parts = input.split(' ');

    // Step 2: Convert to int
    List<int> numbers = parts.map((x) => int.parse(x)).toList();

    List<int> tripled = numbers.map((n) => n * 3).toList();

    print("Tripled numbers: $tripled");
  } else {
    print("No input provided.");
  }
}
