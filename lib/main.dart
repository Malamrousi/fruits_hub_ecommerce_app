import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub/core/routing/route_name.dart';
import 'package:fruit_hub/core/services/shared_preferences.dart';
import 'package:fruit_hub/core/utils/color_manger.dart';

import 'core/routing/routing.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init();
  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruits Hub',
      theme: ThemeData(
          fontFamily: 'Cairo',
          colorScheme:
              ColorScheme.fromSeed(seedColor: ColorManger.primaryColor)),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        return supportedLocalesLang(supportedLocales, locale);
      },
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: RouteName.splash,
    );
  }

  Locale supportedLocalesLang(
      Iterable<Locale> supportedLocales, Locale? locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale?.languageCode) {
        return supportedLocale;
      }
    }
    return const Locale('ar');
  }
}
