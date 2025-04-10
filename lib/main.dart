import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/routing/route_name.dart';
import 'package:fruit_hub/core/services/get_it_services.dart';
import 'package:fruit_hub/core/services/shared_preferences.dart';
import 'package:fruit_hub/core/services/simple_bloc_observer.dart';
import 'package:fruit_hub/core/utils/color_manger.dart';
import 'package:fruit_hub/firebase_options.dart';

import 'core/routing/routing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SharedPreferencesService.init();
  bool isOnBoardingSeen =
      SharedPreferencesService.getBool(isOnBoardingSeenView);
  setUpGetIt();
  Bloc.observer = SimpleBlocObserver();

  runApp(FruitsHub(isOnBoardingSeen: isOnBoardingSeen));
}

class FruitsHub extends StatelessWidget {
  final bool isOnBoardingSeen;
  const FruitsHub({super.key, required this.isOnBoardingSeen});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      title: 'Fruits Hub',
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar', ''),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        fontFamily: 'Cairo',
        colorScheme: ColorScheme.fromSeed(seedColor: ColorManger.primaryColor),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: user != null 
          ? RouteName.main 
          : isOnBoardingSeen 
              ? RouteName.login 
              : RouteName.onBoarding,
    );
  }
}