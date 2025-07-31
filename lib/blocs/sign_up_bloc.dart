import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:apiflutter/model/auth_repo.dart';
import 'package:apiflutter/utils/sign_up_validator.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpSubmittedEvent>(_onSignUpSubmitted);
    on<SignUpReset>(_onSignUpReset);
    on<InitiSignUpScreenEvent>(_onSignUpIniti);
  }

  Future<void> _onSignUpSubmitted(
    SignUpSubmittedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());

    // ✅ validation
    final emailError = SignUpValidator.validateEmail(event.email);
    final passwordError = SignUpValidator.validatePassword(event.password);

    if (emailError != null) {
      emit(SignUpFailure(emailError));
      return;
    }
    if (passwordError != null) {
      emit(SignUpFailure(passwordError));
      return;
    }

    final authRepo = AuthRepo();

    try {
      final user = await authRepo.signUpWithEmailandPassword(
        email: event.email,
        password: event.password,
        name: "User", // ممكن تعمليها متغيرة لاحقاً
      );
      if (user != null) {
        emit(SignUpSuccess(user.email!));
      } else {
        emit(SignUpFailure('Email already in use'));
      }
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailure('Error: ${e.message}'));
    }
  }

  void _onSignUpReset(SignUpReset event, Emitter<SignUpState> emit) {
    emit(SignUpInitial());
  }

  void _onSignUpIniti(InitiSignUpScreenEvent event, Emitter<SignUpState> emit) {
    emit(SignUpInitial());
  }
}
