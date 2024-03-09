import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../feature.dart';


class AddPatientDataUseCase extends UseCase<Unit, MedicineSchedule> {
  final MedicineRepository repository;

  AddPatientDataUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(MedicineSchedule params) async {
    return await repository.addMedicineSchedule(params);
  }
}
