

import '../../../core/core.dart';
import '../../feature.dart';

class CalendarDependencies {
  static void registerDependencies() {
    sl.registerLazySingleton<CalendarCubit>(() => CalendarCubit());
  }
}
