import 'package:firebase_auth/firebase_auth.dart';

import '../../../feature.dart';

class UserStateChangeUseCase {
  final AuthRepository repository;

  UserStateChangeUseCase(this.repository);

  Stream<User?> call() {
    return repository.userStateChange();
  }
}