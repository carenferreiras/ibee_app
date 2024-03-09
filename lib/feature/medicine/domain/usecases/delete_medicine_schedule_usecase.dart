import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../feature.dart';


class DeleteDispenserUseCase extends UseCase<Unit, String> {
  final MedicineRepository dispenserRepository;

  DeleteDispenserUseCase(this.dispenserRepository);

  @override
  Future<Either<Failure, Unit>> call(String params) async {
    return await dispenserRepository.deleteMedicineSchedule(params);
  }
}
