import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/color_manger.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import 'on_boarding_page_view.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: OnBoardingPageView()),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: ColorManger.primaryColor,
            color: ColorManger.primaryColor.withOpacity(0.5),
           
          ),
        ),
        CustomButton(onPressed: () {}, title: S.of(context).start_now,
        backgroundColor: ColorManger.primaryColor,
        ),
      ],
    );
  }
}
