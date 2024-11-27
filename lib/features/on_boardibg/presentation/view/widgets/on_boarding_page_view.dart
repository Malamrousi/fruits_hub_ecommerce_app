import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';
import 'page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
          backgroundImage: Assets.imagesObBoardingShape1,
          image: Assets.imagesFruitBasket1,
          description: S.of(context).splash_description,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).welcome_hello),
              Text(S.of(context).welcome_fruit),
              Text(S.of(context).welcome_hub),
            ],
          ),
        ),
        PageViewItem(
          backgroundImage: Assets.imagesObBoardingShape2,
          image: Assets.imagesFruitBasket2,
          description: S.of(context).search_description,
          title: Center(
            child: Text(
              S.of(context).search_shop,
              style: AppStyles.font23BlackBold,
            ),
          ),
        ),
      ],
    );
  }
}
