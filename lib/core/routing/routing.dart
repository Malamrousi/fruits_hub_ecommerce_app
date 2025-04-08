import 'package:flutter/material.dart';
import 'package:fruit_hub/core/routing/route_name.dart';
import 'package:fruit_hub/features/auth/presentation/view/login_view.dart';
import 'package:fruit_hub/features/auth/presentation/view/sign_up_view.dart';
import 'package:fruit_hub/features/splash/presentation/view/splash_view.dart';

import '../../features/best_selling/presentation/view/best_selling_view.dart';
import '../../features/checkout/presentation/view/checkout_screen.dart';
import '../../features/home/presentation/view/main_view.dart';
import '../../features/on_boardibg/presentation/view/on_boarding_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.splash:
      return MaterialPageRoute(
        builder: (_) => const SplashView(),
      );
    case RouteName.onBoarding:
      return MaterialPageRoute(
        builder: (_) => const OnBoardingView(),
      );
    case RouteName.login:
      return MaterialPageRoute(
        builder: (_) => const LoginView(),
      );
    case RouteName.signUp:
      return MaterialPageRoute(
        builder: (_) => const SignUpView(),
      );
    case RouteName.main:
      return MaterialPageRoute(
        builder: (_) => const MainView(),
      );
          case RouteName.bestSelling:
      return MaterialPageRoute(
        builder: (_) => const BestSellingView(),
      );
             case RouteName.checkout:
      return MaterialPageRoute(
        builder: (_) => const CheckoutScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Text('No Routes defied to ${settings.name}'),
        ),
      );
  }
}
