import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';
import '../../../feature.dart';



class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalendarCubit>(
      create: (context) => sl<CalendarCubit>(),
      child: Container(
        margin: AppMargin.mediumH,
        padding: AppPadding.small,
        height: AppHeight.h130.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20).w,
          color: AppColors.primary.withOpacity(0.1),
        ),
        child: BlocBuilder<CalendarCubit, DateTime>(
          builder: (context, state) {
            return CustomCalendar(caledarCubit: context.read<CalendarCubit>());
          },
        ),
      ),
    );
  }
}
