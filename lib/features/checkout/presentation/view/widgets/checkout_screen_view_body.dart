import 'package:flutter/widgets.dart';
import 'package:fruit_hub/core/helper/spacing.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/checkout_steps_page_view.dart';
import 'checkout_steps.dart';

class CheckoutScreenViewBody extends StatefulWidget {
  const CheckoutScreenViewBody({super.key});

  @override
  State<CheckoutScreenViewBody> createState() => _CheckoutScreenViewBodyState();
}

class _CheckoutScreenViewBodyState extends State<CheckoutScreenViewBody> {
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          verticalSpacing(20),
          const CheckoutSteps(),
          verticalSpacing(20),
          Expanded(
              child: CheckoutStepsPageView(pageController: pageController)),
          verticalSpacing(20),
          CustomButton(
            title: "التالي",
            onPressed: () {},
          ),
          verticalSpacing(30),
        ],
      ),
    );
  }
}