import 'dart:convert';

import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/services/shared_preferences.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

UserEntity getUser() {
  var jsonString = SharedPreferencesService.getString(kSaveUserData);
  var userEntity = UserModel.fromMap(jsonDecode(jsonString));
  return userEntity;
}