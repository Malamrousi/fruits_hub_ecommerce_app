import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/checkout_steps.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SizedBox();
      },
      itemCount: getSteps().length,
    );
  }
}
