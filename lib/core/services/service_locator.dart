import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../feature/feature.dart';
import '../core.dart';



GetIt sl = GetIt.instance;

class ServiceLocator {
  static init() {
    // Core
    sl.registerFactory(() => FirebaseAuth.instance);
    sl.registerFactory(() => NetworkConnection());
    sl.registerLazySingleton(() => AppRouter(sl()));
    sl.registerLazySingleton(() => GoRouterRefreshStream(sl()));
    sl.registerLazySingleton(() => LocalNotificationServices());

    AuthDependencies.registerDependencies();
    CalendarDependencies.registerDependencies();
    MedicineDependencies.registerDependencies();
    NotificationDependencies.registerDependencies();
  }
}
