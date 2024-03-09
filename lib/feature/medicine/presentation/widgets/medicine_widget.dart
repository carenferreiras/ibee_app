import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/core.dart';
import '../../../feature.dart';

class MedicineWidget extends StatelessWidget {
  const MedicineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MedicineCubit>(
      create: (context) => sl<MedicineCubit>(),
      child: BlocBuilder<MedicineCubit, MedicineState>(
        builder: (context, state) {
          return MedicineSection(
            medicines: state.medicines,
            currentWeekday: state.currentWeekday,
          );
        },
      ),
    );
  }
}
