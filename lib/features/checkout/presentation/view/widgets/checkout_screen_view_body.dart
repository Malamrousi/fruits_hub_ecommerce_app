import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper/spacing.dart';
import 'package:fruit_hub/core/utils/show_toast.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/checkout_steps_page_view.dart';
import 'checkout_steps.dart';

class CheckoutScreenViewBody extends StatefulWidget {
  const CheckoutScreenViewBody({super.key});

  @override
  State<CheckoutScreenViewBody> createState() => _CheckoutScreenViewBodyState();
}

class _CheckoutScreenViewBodyState extends State<CheckoutScreenViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(AutovalidateMode.disabled);

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
    valueNotifier.dispose();
  }

  int currentPage = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
              child: CheckoutStepsPageView(
            pageController: pageController,
            valueListenable: valueNotifier,
            formKey: formKey,
          )),
          verticalSpacing(20),
          CustomButton(
            title: getNextButtonTitle(currentPage),
            onPressed: () {
              if (currentPage == 0) {
                _handelShippingAddress(context);
              } else if (currentPage == 1) {
                _handelAddress(context);
              }
            },
          ),
          verticalSpacing(30),
        ],
      ),
    );
  }

  void _handelShippingAddress(BuildContext context) {
    if (context.read<OrderEntity>().payWidthCash != null) {
      pageController.animateToPage(currentPage + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      ShowToast.showToastErrorTop(message: "اختر طريقة الدفع الاولى");
    }
  }

  void _handelAddress(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      pageController.animateToPage(currentPage + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }else {
      valueNotifier.value = AutovalidateMode.always;
      ShowToast.showToastErrorTop(message: "ادخل  جميع البيانات المطلوبة");
    }
  }

  String getNextButtonTitle(int currentPage) {
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
