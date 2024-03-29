import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';
import '../../../feature.dart';

class MedicineScheduleTile extends StatelessWidget {
  const MedicineScheduleTile({
    super.key,
    required this.medicineSchedule,
  });
  final MedicineSchedule medicineSchedule;

  @override
  Widget build(BuildContext context) {
    final String intake = Values.getIntakePerWeek(
      medicineSchedule.dose,
      medicineSchedule.schedule.times.length,
      medicineSchedule.schedule.days.length,
    ).toString();
    return CustomCardTile(
      onTap: () => BottomSheetUtils.showButtomSheet(
        context,
        EditDispenserForm(
          medicine: medicineSchedule,
          index: medicineSchedule.index,
        ),
      ),
      icon: MedicineIconCard(type: medicineSchedule.type),
      title: medicineSchedule.medicine,
      subtitle: '$intake ${medicineSchedule.type.shortName} / week',
      footer: CardTileFooter(color: medicineSchedule.type.color),
      color: medicineSchedule.type.color.withOpacity(0.1),
    );
  }
}

class CardTileFooter extends StatelessWidget {
  const CardTileFooter({
    super.key,
    required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 14.w).w,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(100).w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: AppPadding.smallH,
                  child: Text(
                    'Edit',
                    style: textTheme.titleSmall!.copyWith(
                      fontSize: AppFontSize.f12.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
