import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'sign_up_screen.dart';
import '../utils/login_validator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();

                final emailError = LoginValidator.validateEmail(email);
                final passwordError = LoginValidator.validatePassword(password);

                if (emailError != null || passwordError != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(emailError ?? passwordError!),
                      backgroundColor: const Color.fromARGB(255, 192, 15, 15),
                    ),
                  );
                  return;
                }

                try {
                  final user =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Login successful, welcome ${user.user!.email}!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } on FirebaseAuthException catch (e) {
                  String errorMessage = '';

                  if (e.code == 'user-not-found') {
                    errorMessage = 'No user found for this email.';
                  } else if (e.code == 'wrong-password') {
                    errorMessage = 'Incorrect password.';
                  } else if (e.code == 'invalid-email') {
                    errorMessage = 'Invalid email format.';
                  } else {
                    errorMessage =
                        e.message ?? 'Login failed. Please try again.';
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(errorMessage),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignUpScreen()),
                );
              },
              child: const Text(
                'Create an account',
                style: TextStyle(
                  color: Color.fromARGB(255, 40, 29, 139),
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
