import 'package:flutter/widgets.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
            child: StepItem(
          isActive: false,
          index: "${index + 1}",
          text: getSteps()[index],
        ));
      }),
    );
  }
}

List<String> getSteps() {
  return ["الشحن", "الدفع", "الدفع", "المراجعه"];
}
