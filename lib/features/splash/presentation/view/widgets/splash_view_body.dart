import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/helper/extension.dart';
import 'package:fruit_hub/core/services/shared_preferences.dart';
import 'package:fruit_hub/core/utils/app_images.dart';

import '../../../../../constant.dart';
import '../../../../../core/routing/route_name.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    executeNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment:
            MainAxisAlignment.start ,
          children: [
            SvgPicture.asset(Assets.imagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(
          Assets.imagesSplashButton,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void executeNavigation() {
    bool isOnBoardingSeen =
        SharedPreferencesService.getBool(isOnBoardingSeenView);
    Future.delayed(const Duration(seconds: 2), () {
      if (isOnBoardingSeen) {
        context.pushReplacementNamed(RouteName.login);
      } else {
        context.pushReplacementNamed(RouteName.onBoarding);
      }
    });
  }
}

