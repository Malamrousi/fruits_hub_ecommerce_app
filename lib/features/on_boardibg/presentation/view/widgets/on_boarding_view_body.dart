import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/utils/color_manger.dart';

import '../../../../../constant.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import 'on_boarding_page_view.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: OnBoardingPageView(
          pageController: pageController,
        )),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: ColorManger.primaryColor,
            color:currentPage==1 ? ColorManger.primaryColor: ColorManger.primaryColor.withOpacity(0.5),
          ),
        ),
        verticalSpacing(29),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: currentPage == 1 ? true : false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomButton(
              onPressed: () {},
              bottomHeight: 54,
              title: S.of(context).start_now,
              backgroundColor: ColorManger.primaryColor,
              textStyle: AppStyles.font16WhiteBold,
              borderRadius: kBorderRadius,
            ),
          ),
        ),
        verticalSpacing(43),
      ],
    );
  }
}
