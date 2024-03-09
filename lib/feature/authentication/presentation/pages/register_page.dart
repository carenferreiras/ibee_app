import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../feature.dart';


class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignUpCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundSecondary,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.backgroundSecondary,
            leading: const CustomBackButton()),
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state.status == AuthStatus.failure) {
                  SnackBarUtils.showErrorSnackBar(
                      context, AppMessages.regiserationFailed, state.message);
                }
              },
              builder: (context, state) {
                final cubit = context.read<SignUpCubit>();
                return RegisterForm(cubit: cubit, state: state);
              },
            ),
          ),
        ),
      ),
    );
  }
}
