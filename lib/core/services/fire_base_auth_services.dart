import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exception.dart';
import 'package:fruit_hub/core/func/is_arabic.dart';
import 'dart:developer';

class FireBaseAuthServices {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(
            message: isArabic()
                ? 'كلمة المرور ضعيفة'
                : 'Password should be at least 6 characters');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: isArabic()
                ? 'الحساب موجود بالفعل لهذا البريد الإلكتروني'
                : 'The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        throw CustomException(
            message: isArabic()
                ? 'عنوان البريد الإلكتروني غير صالح'
                : 'The email address is badly formatted.');
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException(
            message: isArabic()
                ? 'حسابات البريد الإلكتروني غير ممكنة'
                : 'Email/password accounts are not enabled. Please contact support.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: isArabic()
                ? 'خطأ في الاتصال بالشبكة'
                : 'Network error. Please check your internet connection.');
      } else {
        throw CustomException(
            message: isArabic()
                ? 'حدث خطأ ، يرجى المحاولة مرة أخرى'
                : 'An unexpected error occurred: ${e.message}');
      }
    } catch (e) {
      log(e.toString());
      throw CustomException(
     
          message: isArabic()
              ? 'حدث خطأ ، يرجى المحاولة مرة أخرى'
              : 'An error occurred, please try again later.');
    }
  }
}
