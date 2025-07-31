part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class SignUpSubmittedEvent extends SignUpEvent {
  final String email;
  final String password;

  SignUpSubmittedEvent({
    required this.email,
    required this.password,
  });
}

class SignUpReset extends SignUpEvent {}

class InitiSignUpScreenEvent extends SignUpEvent {}
