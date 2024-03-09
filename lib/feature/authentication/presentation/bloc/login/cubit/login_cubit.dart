import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/enums.dart';
import '../../../../../feature.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(const LoginState());

  final LoginUseCase loginUseCase;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    if (state.status == AuthStatus.submiting) return;
    emit(state.copyWith(status: AuthStatus.submiting));
    final result = await loginUseCase(
      UserProfile(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.fold(
      (failure) => emit(
          state.copyWith(status: AuthStatus.failure, message: failure.message)),
      (user) => emit(state.copyWith(status: AuthStatus.success)),
    );
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }
}
