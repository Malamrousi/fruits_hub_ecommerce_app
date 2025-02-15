import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
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
          isVisible: true,
          backgroundImage: Assets.imagesObBoardingShape1,
          image: Assets.imagesFruitBasket1,
          description: "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
               "مرحبًا بك في",
                style: AppStyles.font23BlackBold,
              ),
              const SizedBox(width: 4),
              Text(
               "Fruit",
                style: AppStyles.font23GoldenBold,
              ),
              Text(
               "HUB",
                style: AppStyles.font23sPrimaryColorBold,
              ),
            ],
          ),
        ),
        PageViewItem(
          isVisible: false,
          backgroundImage: Assets.imagesObBoardingShape2,
          image: Assets.imagesFruitBasket2,
          description: "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
          title: Center(
            child: Text(
              "ابحث وتسوق",
              style: AppStyles.font23BlackBold,
            ),
          ),
        ),
      ],
    );
  }
}
