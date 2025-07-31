class LoginValidator {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return 'Invalid email format';
    }

    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    }
    return null;
  }
}
