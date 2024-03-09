import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../feature.dart';


class MedicineSection extends StatelessWidget {
  const MedicineSection({
    super.key,
    required this.medicines,
    required this.currentWeekday,
  });
  final List<Medicine> medicines;
  final int currentWeekday;

  @override
  Widget build(BuildContext context) {
    final String currentWeekdayName =
        DateTimeFormatter.getWeekdayName(currentWeekday);
    return CardSection(
      title: '$currentWeekdayName\'s Medications',
      itemCount: medicines.isNotEmpty ? medicines.length : 1,
      itemBuilder: (context, index) {
        if (medicines.isEmpty) {
          return const EmptyTile(message: AppStrings.noMedicines);
        } else {
          return MedicineTile(medicine: medicines[index]);
        }
      },
    );
  }
}
