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
    super.initState();
    pageController = PageController(initialPage: 0);

    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          verticalSpacing(20),
          CheckoutSteps(
            pageController: pageController,
            currentState: currentPage,
          ),
          verticalSpacing(20),
          Expanded(
              child: CheckoutStepsPageView(pageController: pageController)),
          verticalSpacing(20),
          CustomButton(
            title: getNextButtonTitle(currentPage),
            onPressed: () {
              pageController.animateToPage(
                currentPage + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            },
          ),
          verticalSpacing(30),
        ],
      ),
    );
  }

  String getNextButtonTitle(int  currentPage) {
    switch (currentPage) {
      case 0:
        return "التالي";
      case 1:
        return "التالي";
      case 2:
        return "الدافع باستخدام paypal";
      default:
        return "التالي";
    }
  }
}
