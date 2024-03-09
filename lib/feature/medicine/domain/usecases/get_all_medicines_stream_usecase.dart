
import '../../../feature.dart';

class GetDispenserStreamUseCase {
  final MedicineRepository repository;

  GetDispenserStreamUseCase(this.repository);

  Stream<List<MedicineSchedule>> call(String patientId) {
    return repository.getAllMedicinesStream(patientId);
  }
}
