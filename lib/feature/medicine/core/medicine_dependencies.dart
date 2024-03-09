
import '../../../core/core.dart';
import '../../feature.dart';

class MedicineDependencies {
  static void registerDependencies() {
    // Data sources
    sl.registerLazySingleton<MedicineRemoteDataSource>(
        () => MedicineRemoteDataSourceImpl());

    // Repositories
    sl.registerLazySingleton<MedicineRepository>(
        () => MedicineRepositoryImpl(sl()));

    // Use cases
    sl.registerLazySingleton(() => AddPatientDataUseCase(sl()));
    sl.registerLazySingleton(() => DeleteDispenserUseCase(sl()));
    sl.registerLazySingleton(() => GetDispenserStreamUseCase(sl()));

    // Bloc
    sl.registerFactory<AllMedicinesScheduleBloc>(
        () => AllMedicinesScheduleBloc(sl(), sl()));
    sl.registerFactory<MedicineScheduleBloc>(
        () => MedicineScheduleBloc(sl(), sl()));

    // Cubit
    sl.registerFactory<MedicineFormCubit>(() => MedicineFormCubit());
    sl.registerFactory<MedicineCubit>(() => MedicineCubit(sl(), sl()));
  }
}
