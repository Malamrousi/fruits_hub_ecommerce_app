import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exception.dart';
import 'package:fruit_hub/core/errors/auth_failure.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'dart:convert';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';


class FireBaseAuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final AuthFailure authFailure = AuthFailure();

  Future<void> deleteUser()async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
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

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    try {
      if (googleUser == null) {
        throw CustomException(message: 'Something went wrong');
      }

      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return (await FirebaseAuth.instance.signInWithCredential(credential))
          .user!;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: authFailure.handleFirebaseAuthError(e));
    } catch (e) {
      throw CustomException(message: authFailure.handleGeneralError(e));
    }
  }

  Future<User> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.status == LoginStatus.cancelled) {
        throw CustomException(message: 'Login cancelled by user');
      }

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      return (await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential))
          .user!;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: authFailure.handleFirebaseAuthError(e));
    } catch (e) {
      throw CustomException(message: authFailure.handleGeneralError(e));
    }
  }

  String generateNonce([int length = 32]) {
  final charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final random = math.Random.secure();
  return List.generate(length, (_) => charset[random.nextInt(charset.length)])
      .join();
}

/// Returns the sha256 hash of [input] in hex notation.
String sha256ofString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}

Future<User> signInWithApple() async {
  // To prevent replay attacks with the credential returned from Apple, we
  // include a nonce in the credential request. When signing in with
  // Firebase, the nonce in the id token returned by Apple, is expected to
  // match the sha256 hash of `rawNonce`.
  try {
  final rawNonce = generateNonce();
  final nonce = sha256ofString(rawNonce);
  
  // Request credential for the currently signed in Apple account.
  final appleCredential = await SignInWithApple.getAppleIDCredential(
    scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
    nonce: nonce,
  );
  
  // Create an `OAuthCredential` from the credential returned by Apple.
  final oauthCredential = OAuthProvider("apple.com").credential(
    idToken: appleCredential.identityToken,
    rawNonce: rawNonce,
  );
  
  // Sign in the user with Firebase. If the nonce we generated earlier does
  // not match the nonce in `appleCredential.identityToken`, sign in will fail.
  return (await FirebaseAuth.instance.signInWithCredential(oauthCredential))
      .user!;
} on FirebaseAuthException catch (e) {
      throw CustomException(message: authFailure.handleFirebaseAuthError(e));
    } catch (e) {
      throw CustomException(message: authFailure.handleGeneralError(e));
    }
}
}
