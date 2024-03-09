import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../feature.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundSecondary,
        appBar:
            const CustomAppBar(backgroundColor: AppColors.backgroundSecondary),
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state.status == AuthStatus.failure) {
                  SnackBarUtils.showErrorSnackBar(
                      context, AppMessages.loginFailed, state.message);
                }
              },
              builder: (context, state) {
                final cubit = context.read<LoginCubit>();
                return LoginForm(cubit: cubit, state: state);
              },
            ),
          ),
        ),
      ),
    );
  }
}
