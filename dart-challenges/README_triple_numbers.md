# 🧩 Dart Problem: Triple Each Number in a List

## 📋 Description

This Dart program prompts the user to enter a list of **space-separated integers**, then uses the `map()` method to **multiply each number by 3**, and prints the new list.


## 🚀 How It Works

1. The user is prompted to enter numbers separated by spaces.
2. The input string is split into a list using `.split(' ')`.
3. Each string number is parsed to `int` using `.map()` and `int.parse()`.
4. Each number is then tripled using `.map((n) => n * 3)`.
5. The result is printed as a list of tripled numbers.



### ✅ Example:

Enter numbers separated by space: 2 4 6

**Output:**
Tripled numbers: [6, 12, 18]

