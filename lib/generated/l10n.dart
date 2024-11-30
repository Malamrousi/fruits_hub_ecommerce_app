// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Discover a unique shopping experience with premium FruitHUB, our wide collection of excellent fresh fruits, and get the best deals and high quality`
  String get splash_description {
    return Intl.message(
      'Discover a unique shopping experience with premium FruitHUB, our wide collection of excellent fresh fruits, and get the best deals and high quality',
      name: 'splash_description',
      desc: '',
      args: [],
    );
  }

  /// `Search and Shop`
  String get search_shop {
    return Intl.message(
      'Search and Shop',
      name: 'search_shop',
      desc: '',
      args: [],
    );
  }

  /// `Learn about the best fresh fruits, goods ever, and exclusive products to limit unlisted items`
  String get search_description {
    return Intl.message(
      'Learn about the best fresh fruits, goods ever, and exclusive products to limit unlisted items',
      name: 'search_description',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get start_now {
    return Intl.message(
      'Start Now',
      name: 'start_now',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to`
  String get welcome_hello {
    return Intl.message(
      'Welcome to',
      name: 'welcome_hello',
      desc: '',
      args: [],
    );
  }

  /// `Fruit`
  String get welcome_fruit {
    return Intl.message(
      'Fruit',
      name: 'welcome_fruit',
      desc: '',
      args: [],
    );
  }

  /// `Hub`
  String get welcome_hub {
    return Intl.message(
      'Hub',
      name: 'welcome_hub',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup {
    return Intl.message(
      'Sign Up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email_hint {
    return Intl.message(
      'Email',
      name: 'email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password_hint {
    return Intl.message(
      'Password',
      name: 'password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name_hint {
    return Intl.message(
      'Name',
      name: 'name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google`
  String get login_google {
    return Intl.message(
      'Login with Google',
      name: 'login_google',
      desc: '',
      args: [],
    );
  }

  /// `Login with Apple`
  String get login_apple {
    return Intl.message(
      'Login with Apple',
      name: 'login_apple',
      desc: '',
      args: [],
    );
  }

  /// `Login with Facebook`
  String get login_facebook {
    return Intl.message(
      'Login with Facebook',
      name: 'login_facebook',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgot_password_title {
    return Intl.message(
      'Forgot Password',
      name: 'forgot_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number to send verification code`
  String get forgot_password_desc {
    return Intl.message(
      'Enter your phone number to send verification code',
      name: 'forgot_password_desc',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get phone_hint {
    return Intl.message(
      'Mobile Number',
      name: 'phone_hint',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get send_code {
    return Intl.message(
      'Send Code',
      name: 'send_code',
      desc: '',
      args: [],
    );
  }

  /// `Code Verification`
  String get verify_title {
    return Intl.message(
      'Code Verification',
      name: 'verify_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code sent to`
  String get verify_desc {
    return Intl.message(
      'Enter the code sent to',
      name: 'verify_desc',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verify_button {
    return Intl.message(
      'Verify Code',
      name: 'verify_button',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password_title {
    return Intl.message(
      'Reset Password',
      name: 'reset_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Create new password`
  String get reset_password_desc {
    return Intl.message(
      'Create new password',
      name: 'reset_password_desc',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password_hint {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Set New Password`
  String get set_new_password {
    return Intl.message(
      'Set New Password',
      name: 'set_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed Successfully`
  String get success_title {
    return Intl.message(
      'Password Changed Successfully',
      name: 'success_title',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been changed successfully`
  String get success_desc {
    return Intl.message(
      'Your password has been changed successfully',
      name: 'success_desc',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to`
  String get terms_text_start {
    return Intl.message(
      'By creating an account, you agree to',
      name: 'terms_text_start',
      desc: '',
      args: [],
    );
  }

  /// `Terms`
  String get terms_text_terms {
    return Intl.message(
      'Terms',
      name: 'terms_text_terms',
      desc: '',
      args: [],
    );
  }

  /// `and Conditions`
  String get terms_text_end {
    return Intl.message(
      'and Conditions',
      name: 'terms_text_end',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get name_empty {
    return Intl.message(
      'Please enter your name',
      name: 'name_empty',
      desc: '',
      args: [],
    );
  }

  /// `Name must contain only letters and be between 2-50 characters`
  String get name_invalid {
    return Intl.message(
      'Name must contain only letters and be between 2-50 characters',
      name: 'name_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get email_empty {
    return Intl.message(
      'Please enter your email',
      name: 'email_empty',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get email_invalid {
    return Intl.message(
      'Invalid email address',
      name: 'email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get email_format {
    return Intl.message(
      'Please enter a valid email address',
      name: 'email_format',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get password_empty {
    return Intl.message(
      'Please enter your password',
      name: 'password_empty',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get password_length {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'password_length',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one lowercase letter`
  String get password_lowercase {
    return Intl.message(
      'Password must contain at least one lowercase letter',
      name: 'password_lowercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter`
  String get password_uppercase {
    return Intl.message(
      'Password must contain at least one uppercase letter',
      name: 'password_uppercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one number`
  String get password_number {
    return Intl.message(
      'Password must contain at least one number',
      name: 'password_number',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one special character (!@#$%^&*)`
  String get password_special {
    return Intl.message(
      'Password must contain at least one special character (!@#\$%^&*)',
      name: 'password_special',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get password_no_match {
    return Intl.message(
      'Passwords do not match',
      name: 'password_no_match',
      desc: '',
      args: [],
    );
  }

  /// `Please check all fields and try again`
  String get form_invalid {
    return Intl.message(
      'Please check all fields and try again',
      name: 'form_invalid',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get field_required {
    return Intl.message(
      'This field is required',
      name: 'field_required',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
