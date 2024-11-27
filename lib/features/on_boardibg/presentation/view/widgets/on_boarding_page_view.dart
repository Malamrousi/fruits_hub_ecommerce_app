import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

 final PageController pageController;


  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible: (pageController.hasClients ? pageController.page!.round() : 0) ==0 ,
          backgroundImage: Assets.imagesObBoardingShape1,
          image: Assets.imagesFruitBasket1,
          description: S.of(context).splash_description,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).welcome_hello,
                style: AppStyles.font23BlackBold,
              ),
              const SizedBox(width: 4),
              Text(
                S.of(context).welcome_hub,
                style: AppStyles.font23GoldenBold,
              ),
              Text(
                S.of(context).welcome_fruit,
                style: AppStyles.font23sPrimaryColorBold,
              ),
            ],
          ),
        ),
        PageViewItem(
          isVisible:(pageController.hasClients ? pageController.page!.round() : 0) !=0 ,
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
