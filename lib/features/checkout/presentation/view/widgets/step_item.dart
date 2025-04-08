import 'package:flutter/widgets.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/inactive_step_item.dart';

import 'active_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem({super.key, required this.text, required this.index, required this.isActive});
  final String text, index;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: InactiveStepItem(text: text, index: index),
        secondChild: ActiveStepItem(text: text),
        crossFadeState: isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration:const Duration(milliseconds: 500));
  }
}
