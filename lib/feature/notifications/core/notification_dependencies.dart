
import '../../../core/core.dart';
import '../../feature.dart';

class NotificationDependencies {
  static void registerDependencies() {
    // Data sources
    sl.registerLazySingleton<LocalNotificationDataSource>(
        () => LocalNotificationDataSourceImpl(sl()));

    // Repositories
    sl.registerLazySingleton<NotificationRepository>(
        () => NotificationRepositoryImpl(sl()));

    // Use cases
    sl.registerLazySingleton(() => ScheduleWeeklyNotificationUseCase(sl()));
    sl.registerLazySingleton(() => CancelNotificationUseCase(sl()));

    // Bloc
    sl.registerFactory(() => NotificationBloc(sl(), sl()));
  }
}
