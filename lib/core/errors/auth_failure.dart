import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../func/is_arabic.dart';

class AuthFailure {
    String handleFirebaseAuthError(FirebaseAuthException e, {String? customMessage}) {
    log('FirebaseAuthException: ${e.toString()}');
    
    switch (e.code) {
      case 'weak-password':
        return isArabic()
            ? 'كلمة المرور ضعيفة'
            : 'Password should be at least 6 characters';
      case 'email-already-in-use':
        return isArabic()
            ? 'الحساب موجود بالفعل لهذا البريد الإلكتروني'
            : 'The account already exists for that email.';
      case 'invalid-email':
        return isArabic()
            ? 'عنوان البريد الإلكتروني غير صالح'
            : 'The email address is badly formatted.';
      case 'operation-not-allowed':
        return isArabic()
            ? 'حسابات البريد الإلكتروني غير ممكنة'
            : 'Email/password accounts are not enabled. Please contact support.';
      case 'network-request-failed':
        return isArabic()
            ? 'خطأ في الاتصال بالشبكة'
            : 'Network error. Please check your internet connection.';
      case 'user-not-found':
      case 'wrong-password':
        return isArabic()
            ? 'كلمة المرور اوالبريد الإلكتروني غير صحيح'
            : 'Wrong email or password provided for that user.';
      case 'invalid-credential':
        return isArabic()
            ?"معلومات التسجيل غير صالحة"
            : "Invalid credential";
      default:
        return isArabic()
            ? 'حدث خطأ ، يرجى المحاولة مرة أخرى'
            : customMessage ?? 'An unexpected error occurred: ${e.message}';
    }
  }

  String handleGeneralError(Object e) {
    log('General Exception: ${e.toString()}');
    return isArabic()
        ? 'حدث خطأ ، يرجى المحاولة مرة أخرى'
        : 'An error occurred, please try again later.';
  }
}