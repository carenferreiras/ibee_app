import 'package:flutter/material.dart';
import '../../core.dart';


class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        size: AppSize.s20,
        color: AppColors.primary,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
