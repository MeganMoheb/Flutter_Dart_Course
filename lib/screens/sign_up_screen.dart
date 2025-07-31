import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apiflutter/blocs/sign_up_bloc.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Welcome ${state.email}')),
              );
            } else if (state is SignUpFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(height: 16), // ✅ مسافة بين Email و Password

                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  const SizedBox(height: 24), // ✅ مسافة قبل الزر

                  state is SignUpLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<SignUpBloc>(context).add(
                              SignUpSubmittedEvent(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                          },
                          child: const Text('Sign Up'),
                        ),

                  const SizedBox(height: 20), // ✅ مسافة قبل الرابط

                  // 🔗 رابط إلى صفحة تسجيل الدخول
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Already have an account? Login',
                      style: TextStyle(
                        color: Color.fromARGB(255, 51, 39, 153),
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
