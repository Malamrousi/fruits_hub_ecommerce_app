import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exception.dart';
import 'package:fruit_hub/core/errors/auth_failure.dart';

class FireBaseAuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final AuthFailure authFailure = AuthFailure();
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: authFailure.handleFirebaseAuthError(e));
    } catch (e) {
      throw CustomException(message: authFailure.handleGeneralError(e));
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: authFailure.handleFirebaseAuthError(e));
    } catch (e) {
      throw CustomException(message: authFailure.handleGeneralError(e));
    }
  }
}
