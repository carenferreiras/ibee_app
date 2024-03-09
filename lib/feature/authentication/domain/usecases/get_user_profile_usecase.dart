import 'package:firebase_auth/firebase_auth.dart';

import '../../../feature.dart';

class GetUserProfileUseCase {
  final AuthRepository repository;

  GetUserProfileUseCase(this.repository);

  User? call() {
    return repository.getUserProfile();
  }
}