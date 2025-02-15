import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';


class AuthFailure {
  String handleFirebaseAuthError(FirebaseAuthException e,
      {String? customMessage}) {
    log('FirebaseAuthException: ${e.toString()}');

    switch (e.code) {
      case 'weak-password':
        return 'كلمة المرور ضعيفة';
      case 'email-already-in-use':
        return 'الحساب موجود بالفعل لهذا البريد الإلكتروني';
      case 'invalid-email':
        return 'عنوان البريد الإلكتروني غير صالح';
      case 'operation-not-allowed':
        return 'حسابات البريد الإلكتروني غير ممكنة';
      case 'network-request-failed':
        return 'خطأ في الاتصال بالشبكة';
      case 'user-not-found':
        return 'لا يوجد حساب لهذا البريد الإلكتروني';
      case 'wrong-password':
        return 'كلمة المرور اوالبريد الإلكتروني غير صحيح';
      case 'invalid-credential':
        return "معلومات التسجيل غير صالحة";
      default:
        return 'حدث خطأ ، يرجى المحاولة مرة أخرى';
    }
  }

  String handleGeneralError(Object e) {
    log('General Exception: ${e.toString()}');
    return 'حدث خطأ ، يرجى المحاولة مرة أخرى';
  }
}
