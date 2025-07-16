# 🧩 Dart Problem: Sum of Numbers Using `reduce()`

## 📋 Description

This Dart program prompts the user to enter a list of **numbers separated by spaces**, converts the input into integers, and calculates the **sum** using the `reduce()` method.

---

## 🚀 How It Works

1. Asks the user to enter numbers (e.g., `4 8 10`).
2. Splits the string by space using `.split(' ')`.
3. Converts the resulting list of strings into integers using `.map()` and `int.parse()`.
4. Uses `.reduce((a, b) => a + b)` to calculate the sum of the numbers.
5. Prints the result.

---

## 🧪 Example Input & Output

### ✅ Example:

Enter numbers separated by space: 4 8 10

**Output:**
Sum = 22
