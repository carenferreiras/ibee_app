import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/core.dart';
import '../../../feature.dart';

class DispenserWidget extends StatelessWidget {
  const DispenserWidget({
    super.key,
    required this.patientId,
  });
  final String patientId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AllMedicinesScheduleBloc>(
      create: (context) => sl<AllMedicinesScheduleBloc>(),
      child: BlocBuilder<AllMedicinesScheduleBloc, AllMedicinesScheduleState>(
        builder: (context, state) {
          switch (state.status) {
            case RequestStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestStatus.success:
              return MedicineScheduleSection(
                  medicineSchedules: state.dispensers, patientId: patientId);
            case RequestStatus.failure:
              return const Center(child: Text('Failed to load data'));
            default:
              return const Center(child: CustomProgressIndicator());
          }
        },
      ),
    );
  }
}
