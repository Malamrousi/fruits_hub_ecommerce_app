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
      desc: 'Splash screen main description',
      args: [],
    );
  }

  /// `Search and Shop`
  String get search_shop {
    return Intl.message(
      'Search and Shop',
      name: 'search_shop',
      desc: 'Search and shop button text',
      args: [],
    );
  }

  /// `Learn about the best fresh fruits, goods ever, and exclusive products to limit unlisted items`
  String get search_description {
    return Intl.message(
      'Learn about the best fresh fruits, goods ever, and exclusive products to limit unlisted items',
      name: 'search_description',
      desc: 'Search section description',
      args: [],
    );
  }

  /// `Start Now`
  String get start_now {
    return Intl.message(
      'Start Now',
      name: 'start_now',
      desc: 'Start now button text',
      args: [],
    );
  }

  /// `skip`
  String get skip {
    return Intl.message(
      'skip',
      name: 'skip',
      desc: 'Skip button text',
      args: [],
    );
  }

  /// `Welcome to`
  String get welcome_hello {
    return Intl.message(
      'Welcome to',
      name: 'welcome_hello',
      desc: 'Welcome message',
      args: [],
    );
  }

  /// `Fruit`
  String get welcome_fruit {
    return Intl.message(
      'Fruit',
      name: 'welcome_fruit',
      desc: 'Brand name part 1',
      args: [],
    );
  }

  /// `Hub`
  String get welcome_hub {
    return Intl.message(
      'Hub',
      name: 'welcome_hub',
      desc: 'Brand name part 2',
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
