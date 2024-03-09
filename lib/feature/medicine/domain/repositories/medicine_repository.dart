import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../feature.dart';


abstract class MedicineRepository {
  Future<Either<Failure, Unit>> addMedicineSchedule(MedicineSchedule dispenser);
  Future<Either<Failure, Unit>> deleteMedicineSchedule(String dispenserId);
  Stream<List<MedicineSchedule>> getAllMedicinesStream(String patientId);
}
