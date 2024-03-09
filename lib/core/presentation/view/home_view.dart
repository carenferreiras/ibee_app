import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../feature/feature.dart';
import '../../core.dart';



class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.authBloc});
  final AuthBloc authBloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: authBloc,
      child: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.only(top: 42).h,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HeaderWidget(authBloc: authBloc),
                const CalendarWidget(),
                const SizedBox(height: 20),
                const MedicineWidget(),
                const SizedBox(height: 20),
                DispenserWidget(patientId: authBloc.state.user.id!),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
