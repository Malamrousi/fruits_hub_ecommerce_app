import 'package:dartz/dartz.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> createUserWidthEmailAndPassword(
      {required String email, required String password, required String name});

  Future<Either<Failures, UserEntity>> loginInWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<Failures, UserEntity>> loginInWithGoogle();
  Future<Either<Failures, UserEntity>> loginInWithFacebook();
  Future<Either<Failures, UserEntity>> loginInWithApple();

  Future addUserData({required UserEntity userEntity});
  Future saveUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String uid});
}
