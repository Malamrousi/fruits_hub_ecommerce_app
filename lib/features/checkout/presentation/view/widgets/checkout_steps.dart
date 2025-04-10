import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/step_item.dart';

import '../../../../../core/utils/show_toast.dart';
import '../../../domain/entities/order_entity.dart';

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
          onTap: () {
               if(context.read<OrderEntity>().payWidthCash != null){
                   pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
           }else{
             ShowToast.showToastErrorTop(message: "اختر طريقة الدفع الاولى");
           }
          },
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
