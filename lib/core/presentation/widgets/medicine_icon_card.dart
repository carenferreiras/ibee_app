import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core.dart';


class MedicineIconCard extends StatelessWidget {
  const MedicineIconCard({
    super.key,
    required this.type,
  });
  final MedicineType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8).w,
      decoration: BoxDecoration(
          borderRadius: AppBorderRadius.small.w, color: type.color),
      child:
          ImageIcon(AssetImage(type.icon), size: 20.h, color: AppColors.white),
    );
  }
}
