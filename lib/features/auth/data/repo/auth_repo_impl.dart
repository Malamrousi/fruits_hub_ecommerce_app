// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fruit_hub/core/errors/exception.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/services/data_base_services.dart';
import 'package:fruit_hub/core/services/shared_preferences.dart';
import 'package:fruit_hub/features/auth/data/data_source/fire_base_auth_data_source.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:fruit_hub/core/utils/back_end_end_points.dart';

import '../../../../constant.dart';

class AuthRepoImpl extends AuthRepo {
  final FireBaseAuthServices fireBaseAuthServices;
  final DataBaseServices dataBaseServices;

  AuthRepoImpl({
    required this.fireBaseAuthServices,
    required this.dataBaseServices,
  });
//createUserWidthEmailAndPassword
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
      var userData = UserEntity(email: user.email!, name: name, uid: user.uid);
      await addUserData(userEntity: userData);

      return right(userData);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);
      log('Error in creating user with email and password: ${e.toString()}');
      return left(ServerFailure(message: 'حدث خطأ ، يرجى المحاولة مرة أخرى'));
    }
  }

//deleteUser
  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await fireBaseAuthServices.deleteUser();
    }
  }

//loginInWithEmailAndPassword
  @override
  Future<Either<Failures, UserEntity>> loginInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await fireBaseAuthServices.signInWithEmailAndPassword(
          email: email, password: password);
      var userData = await getUserData(uid: user.uid);
      await saveUserData(user: userData);
      return right(userData);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('Error in signing in with email and password: ${e.toString()}');
      return left(ServerFailure(message: 'حدث خطأ ، يرجى المحاولة مرة أخرى'));
    }
  }

//loginInWithGoogle
  @override
  Future<Either<Failures, UserEntity>> loginInWithGoogle() async {
    User? user;
    try {
      user = await fireBaseAuthServices.signInWithGoogle();
      var userData = UserModel.fromFirebaseUser(user);
      var isUserExist = await dataBaseServices.isDataExist(
          path: BackEndEndPoints.getUserEndPoint, uid: userData.uid);
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(userEntity: userData);
        await saveUserData(user: userData);
      }
      return right(userData);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);
      log('Error in signing in with google: ${e.toString()}');
      return left(ServerFailure(message: 'حدث خطأ ، يرجى المحاولة مرة أخرى'));
    }
  }

//loginInWithFacebook
  @override
  Future<Either<Failures, UserEntity>> loginInWithFacebook() async {
    User? user;
    try {
      user = await fireBaseAuthServices.signInWithFacebook();
      var userData = UserModel.fromFirebaseUser(user);
      var isUserExist = await dataBaseServices.isDataExist(
          path: BackEndEndPoints.getUserEndPoint, uid: userData.uid);
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(userEntity: userData);
        await saveUserData(user: userData);
      }
      return right(userData);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);
      log('Error in signing in with facebook: ${e.toString()}');
      return left(ServerFailure(message: 'حدث خطأ ، يرجى المحاولة مرة أخرى'));
    }
  }

//loginInWithApple
  @override
  Future<Either<Failures, UserEntity>> loginInWithApple() async {
    User? user;
    try {
      user = await fireBaseAuthServices.signInWithApple();
      var isUserExist = await dataBaseServices.isDataExist(
          path: BackEndEndPoints.getUserEndPoint, uid: user.uid);
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(userEntity: UserModel.fromFirebaseUser(user));
      }

      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('Error in signing in with apple: ${e.toString()}');
      return left(ServerFailure(message: 'حدث خطأ ، يرجى المحاولة مرة أخرى'));
    }
  }

//addUserData
  @override
  Future addUserData({
    required UserEntity userEntity,
  }) async {
    await dataBaseServices.addData(
        path: BackEndEndPoints.addUserEndPoint,
        data: UserModel.fromEntity(userEntity).toMap(),
        uid: userEntity.uid);
  }

//getUserData
  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var data = await dataBaseServices.getData(
        path: BackEndEndPoints.getUserEndPoint, uid: uid);
    return UserModel.fromMap(data);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await SharedPreferencesService.setString(kSaveUserData, jsonData);
  }
}
