import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../feature.dart';


class ScheduleWeeklyNotificationUseCase
    extends UseCase<Unit, NotificationData> {
  ScheduleWeeklyNotificationUseCase(this._notificationRepository);

  final NotificationRepository _notificationRepository;
  
  @override
  Future<Either<Failure, Unit>> call(NotificationData params) async {
    return await _notificationRepository.scheduleWeeklyNotification(params);
  }
}
