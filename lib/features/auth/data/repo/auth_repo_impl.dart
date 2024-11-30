import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/exception.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/func/is_arabic.dart';
import 'package:fruit_hub/core/services/fire_base_auth_services.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repo/auth_repo.dart';
import 'dart:developer';

class AuthRepoImpl extends AuthRepo {
  final FireBaseAuthServices fireBaseAuthServices;

  AuthRepoImpl({required this.fireBaseAuthServices});
  @override
  Future<Either<Failures, UserEntity>> createUserWidthEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var user = await fireBaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('Error in creating user with email and password: ${e.toString()}');
      return left(ServerFailure(
          message: isArabic()
              ? 'حدث خطأ ، يرجى المحاولة مرة أخرى'
              : 'An error occurred, please try again later'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> loginInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await fireBaseAuthServices.signInWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('Error in signing in with email and password: ${e.toString()}');
      return left(ServerFailure(
          message: isArabic()
              ? 'حدث خطأ ، يرجى المحاولة مرة أخرى'
              : 'An error occurred, please try again later'));
    }
  }
}
