import 'package:flutter/material.dart';
import 'package:fruit_hub/core/routing/route_name.dart';

import 'core/routing/routing.dart';

void main() {
  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
    onGenerateRoute:generateRoute,
    initialRoute: RouteName.splash,
    );
  }
}