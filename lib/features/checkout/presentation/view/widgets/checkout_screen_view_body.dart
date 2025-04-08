import 'package:flutter/widgets.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/active_step_item.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/inactive_step_item.dart';

class CheckoutScreenViewBody extends StatelessWidget {
  const CheckoutScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      children: [
     InactiveStepItem()

      ],

    ),);
  }
}