import 'package:dartz/dartz.dart';
import '../../../feature.dart';
import '../../../../core/core.dart';


class LogoutUseCase extends UseCase<Unit, NoParams> {
  LogoutUseCase(this.repository);
  final AuthRepository repository;

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await repository.signOut();
  }
}