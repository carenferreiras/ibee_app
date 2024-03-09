
import '../../../core/core.dart';
import '../../feature.dart';

class AuthDependencies {
  static void registerDependencies() {
    // Data sources
    sl.registerLazySingleton<AuthDataSource>(
        () => AuthDataSourceImpl(sl(), sl()));

    // Repositories
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

    // Use cases
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => SignUpUseCase(sl()));
    sl.registerLazySingleton(() => LogoutUseCase(sl()));
    sl.registerLazySingleton(() => UserStateChangeUseCase(sl()));
    sl.registerLazySingleton(() => GetUserProfileUseCase(sl()));

    // Bloc
    sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl(), sl()));

    // Cubit
    sl.registerFactory<SignUpCubit>(() => SignUpCubit(sl()));
    sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
  }
}