import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/helper/extension.dart';
import 'package:fruit_hub/core/routing/route_name.dart';
import 'package:fruit_hub/core/services/shared_preferences.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/utils/app_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.backgroundImage,
      required this.isVisible});

  final String image, description, backgroundImage;
  final Widget title;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              GestureDetector(
                onTap: () {
                  SharedPreferencesService
                      .setBool(isOnBoardingSeenView, true);
                  context.pushReplacementNamed(RouteName.login);
                },
                child: Visibility(
                  visible: isVisible,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "Skip",
                      style: AppStyles.font13stoneGraySemiBold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpacing(64),
        title,
        verticalSpacing(24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: AppStyles.font13stoneGraySemiBold,
          ),
        )
      ],
    );
  }
}
