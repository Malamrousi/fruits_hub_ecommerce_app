import 'package:flutter/material.dart';
import 'package:fruit_hub/core/routing/route_name.dart';
import 'package:fruit_hub/features/splash/presentation/view/splash_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.splash:
      return MaterialPageRoute(builder: (_) => const SplashView());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Text('No Routes defied to ${settings.name}'),
              ));
  }
}
