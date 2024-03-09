import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../feature.dart';



class MedicineRepositoryImpl extends MedicineRepository {
  MedicineRepositoryImpl(this.remoteDataSource);
  final MedicineRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, Unit>> addMedicineSchedule(
      MedicineSchedule dispenser) async {
    try {
      await remoteDataSource.addMedicineSchedule(dispenser);
      return right(unit);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Stream<List<MedicineSchedule>> getAllMedicinesStream(String patientId) {
    return remoteDataSource.getAllMedicinesStream(patientId);
  }

  @override
  Future<Either<Failure, Unit>> deleteMedicineSchedule(
      String dispenserId) async {
    try {
      await remoteDataSource.deleteMedicineSchedule(dispenserId);
      return right(unit);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
