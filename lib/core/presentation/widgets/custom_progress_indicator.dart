import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core.dart';


class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: AppMargin.medium.w,
        child: const CircularProgressIndicator(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
