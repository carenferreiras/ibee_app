import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../feature.dart';

class CancelNotificationUseCase {
  final NotificationRepository notificationRepository;

  CancelNotificationUseCase(this.notificationRepository);

  Future<Either<Failure, Unit>> call(int id, Schedule params) async {
    return await notificationRepository.cancelNotification(id, params);
  }
}
