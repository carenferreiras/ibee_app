
import '../../../../core/core.dart';
import '../../../feature.dart';

class MedicineScheduleModel extends MedicineSchedule {
  const MedicineScheduleModel({
    required super.id,
    required super.index,
    required super.userId,
    required super.medicine,
    required super.type,
    required super.dose,
    required ScheduleModel super.schedule,
  });

  factory MedicineScheduleModel.fromJson(Map<String, dynamic> json) =>
      MedicineScheduleModel(
        index: json["index"],
        id: json["id"],
        userId: json["userId"],
        medicine: json["medicine"],
        dose: json["dose"],
        type: json["type"] == "capsule"
            ? MedicineType.capsule
            : MedicineType.tablet,
        schedule: ScheduleModel.fromJson(json["schedule"]),
      );
}
