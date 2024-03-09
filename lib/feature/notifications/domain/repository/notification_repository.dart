import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../feature.dart';

abstract class NotificationRepository {
  Future<Either<Failure, Unit>> scheduleWeeklyNotification(
      NotificationData notificationData);
  Future<Either<Failure, Unit>> cancelNotification(int id, Schedule schedule);
}
