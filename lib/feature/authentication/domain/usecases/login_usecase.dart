import 'package:dartz/dartz.dart';

import '../../../feature.dart';
import '../../../../core/core.dart';


class LoginUseCase extends UseCase<Unit, UserProfile> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(UserProfile params) async {
    return await repository.signInWithEmailAndPassword(params);
  }
}