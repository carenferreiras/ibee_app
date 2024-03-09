import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../feature.dart';


class NotificationRepositoryImpl extends NotificationRepository {
  NotificationRepositoryImpl(this.localNotificationDataSource);
  final LocalNotificationDataSource localNotificationDataSource;

  @override
  Future<Either<Failure, Unit>> scheduleWeeklyNotification(
      NotificationData notificationData) async {
    try {
      await localNotificationDataSource
          .scheduleWeeklyNotification(notificationData);
      return right(unit);
    } catch (e) {
      return left(NotificationFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> cancelNotification(
      int id, Schedule schedule) async {
    try {
      await localNotificationDataSource.cancelNotification(id, schedule);
      return right(unit);
    } catch (e) {
      return left(NotificationFailure());
    }
  }
}
