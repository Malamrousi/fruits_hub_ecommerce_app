import 'package:flutter/widgets.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key, required this.currentState, required this.pageController});
  final int currentState;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
            child: GestureDetector(
          onTap: () => pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn),
          child: StepItem(
            isActive: index <= currentState,
            index: "${index + 1}",
            text: getSteps()[index],
          ),
        ));
      }),
    );
  }
}

List<String> getSteps() {
  return ["الشحن", "الدفع", "الدفع"];
}
