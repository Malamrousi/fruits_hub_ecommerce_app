// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fruit_hub/core/errors/exception.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/func/is_arabic.dart';
import 'package:fruit_hub/core/services/data_base_services.dart';
import 'package:fruit_hub/core/services/fire_base_auth_services.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:fruit_hub/core/utils/back_end_end_points.dart';

class AuthRepoImpl extends AuthRepo {
  final FireBaseAuthServices fireBaseAuthServices;
  final DataBaseServices dataBaseServices;

  AuthRepoImpl({
    required this.fireBaseAuthServices,
    required this.dataBaseServices,
  });


  @override
Future<Either<Failures, UserEntity>> createUserWidthEmailAndPassword({
  required String email,
  required String password,
  required String name,
}) async {
  User? user; 
  try {
    user = await fireBaseAuthServices.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    var userData = UserModel(email: user.email!, name: name, uid: user.uid);
    await addUserData(userModel: userData);
    return right(userData);
  } on CustomException catch (e) {
    await deleteUser(user);
    return left(ServerFailure(message: e.message));
  } catch (e) {
    await deleteUser(user);
    log('Error in creating user with email and password: ${e.toString()}');
    return left(ServerFailure(
      message: isArabic()
          ? 'حدث خطأ ، يرجى المحاولة مرة أخرى'
          : 'An error occurred, please try again later',
    ));
  }
}

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await fireBaseAuthServices.deleteUser();
    }
  }

  @override
  Future<Either<Failures, UserEntity>> loginInWithEmailAndPassword(
      {required String email, required String password}) async {
          User? user; 

    try {
       user = await fireBaseAuthServices.signInWithEmailAndPassword(
          email: email, password: password);
          var userData = UserModel.fromFirebaseUser(user);
          await addUserData(userModel: userData);
      return right(userData);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);
      log('Error in signing in with email and password: ${e.toString()}');
      return left(ServerFailure(
          message: isArabic()
              ? 'حدث خطأ ، يرجى المحاولة مرة أخرى'
              : 'An error occurred, please try again later'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> loginInWithGoogle() async {
    User? user;
    try {
      user = await fireBaseAuthServices.signInWithGoogle();
      var userData = UserModel.fromFirebaseUser(user);
      await addUserData(userModel: userData);
      return right(userData);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);
      log('Error in signing in with google: ${e.toString()}');
      return left(ServerFailure(
          message: isArabic()
              ? 'حدث خطأ ، يرجى المحاولة مرة أخرى'
              : 'An error occurred, please try again later'));
    }
  }
  
  @override
  Future<Either<Failures, UserEntity>> loginInWithFacebook() async{
  try {
    var user = await fireBaseAuthServices.signInWithFacebook();
    return right(UserModel.fromFirebaseUser(user));
  } on CustomException catch (e) {
    return left(ServerFailure(message: e.message));
  } catch (e) {
    log('Error in signing in with facebook: ${e.toString()}');
    return left(ServerFailure(
        message: isArabic()
            ? 'حدث خطأ ، يرجى المحاولة مرة أخرى'
            : 'An error occurred, please try again later'));
  }}
  
  @override
  Future<Either<Failures, UserEntity>> loginInWithApple() async{
   try {
    var user = await fireBaseAuthServices.signInWithApple();
    return right(UserModel.fromFirebaseUser(user));
  } on CustomException catch (e) {
    return left(ServerFailure(message: e.message));
  } catch (e) {
    log('Error in signing in with apple: ${e.toString()}');
    return left(ServerFailure(  
        message: isArabic()
            ? 'حدث خطأ ، يرجى المحاولة مرة أخرى'
            : 'An error occurred, please try again later'));
  }
  }
  
  @override
  Future addUserData({required UserModel userModel})async {


    await dataBaseServices.addData(path: BackEndEndPoints.userEndPoint, data: userModel.toMap());
  }
}
