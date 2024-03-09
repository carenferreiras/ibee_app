import 'package:dartz/dartz.dart';
import '../../../feature.dart';
import '../../../../core/core.dart';


class SignUpUseCase extends UseCase<Unit, UserProfile> {
  SignUpUseCase(this.repository);
  final AuthRepository repository;
  @override
  Future<Either<Failure, Unit>> call(UserProfile params) async {
    return await repository.createUserWithEmailAndPassword(params);
  }
}