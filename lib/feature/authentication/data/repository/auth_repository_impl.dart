import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/core.dart';
import '../../../feature.dart';


class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.authDataSourceImpl);
  final AuthDataSource authDataSourceImpl;

  @override
  User getUserProfile() {
    return authDataSourceImpl.getUserProfile();
  }

  @override
  Stream<User?> userStateChange() {
    return authDataSourceImpl.userChangeState();
  }

  @override
  Future<Either<Failure, Unit>> signInWithEmailAndPassword(
      UserProfile user) async {
    try {
      await authDataSourceImpl.signInWithEmailAndPassword(
          user.email!, user.password!);
      return const Right(unit);
    } catch (e) {
      return _handleException(e as Exception,
          message: AppMessages.userNotFound);
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await authDataSourceImpl.signOut();
      return const Right(unit);
    } catch (e) {
      return _handleException(e as Exception);
    }
  }

  @override
  Future<Either<Failure, Unit>> createUserWithEmailAndPassword(
      UserProfile user) async {
    try {
      await authDataSourceImpl.createUserWithEmailAndPassword(
          user.email!, user.password!, user.username!);
      return const Right(unit);
    } catch (e) {
      return _handleException(e as Exception, message: AppMessages.userExists);
    }
  }

  Future<Either<Failure, Unit>> _handleException(
    Exception e, {
    String? message,
  }) async {
    if (e is AuthenticationException) {
      return Left(AuthenticationFailure(message: message));
    } else if (e is NetworkException) {
      return Left(NetworkFailure(message: AppMessages.noInternetConnection));
    } else {
      return Left(UnexpectedFailure());
    }
  }
}