import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.email,
      required super.name,
      required super.uid});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      email: user.email ?? 'no email',
      name: user.displayName ?? '',
      uid: user.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'uid': uid,
    };
  }
}
