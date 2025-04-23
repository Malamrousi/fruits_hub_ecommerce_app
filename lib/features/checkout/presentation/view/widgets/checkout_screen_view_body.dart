import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruit_hub/core/helper/extension.dart';
import 'package:fruit_hub/core/helper/spacing.dart';
import 'package:fruit_hub/core/utils/app_key.dart';
import 'package:fruit_hub/core/utils/show_toast.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/checkout_steps_page_view.dart';
import '../../../domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import '../../cubit/add_order_cubit/add_order_cubit.dart';
import 'checkout_steps.dart';

class CheckoutScreenViewBody extends StatefulWidget {
  const CheckoutScreenViewBody({super.key});

  @override
  State<CheckoutScreenViewBody> createState() => _CheckoutScreenViewBodyState();
}

class _CheckoutScreenViewBodyState extends State<CheckoutScreenViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);

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
            onStepTapped: (index) {
              if (index == 0) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              } else if (index == 1) {
                if (context.read<OrderEntity>().payWidthCash != null) {
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                }
                 else {
                ShowToast.showToastErrorTop(message: "اختر طريقة الدفع الاولى");
              }
              }else{
                _handelAddress(context);
              }
            },
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
              } else {
                processPayment(context);
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
    } else {
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

  void processPayment(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();

    PaypalPaymentEntity paypalPaymentEntity =
        PaypalPaymentEntity.fromEntity(orderEntity);
    var addOrderCubit = context.read<AddOrderCubit>();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: AppKey.paypalClientId,
        secretKey: AppKey.paypalSecretKey,
        transactions: [paypalPaymentEntity.toJson()],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
          context.pop();
          addOrderCubit.addOrder(orderEntity: orderEntity);
        },
        onError: (error) {
          context.pop();
          log("❌❌❌❌ onError: $error ❌❌❌❌");
          ShowToast.showToastErrorTop(message: "❌❌❌❌ onError ❌❌❌❌");
        },
        onCancel: () {
          log("⚠️⚠️⚠️⚠️⚠️ onCancel:⚠️⚠️⚠️⚠️⚠️");
          ShowToast.showToastErrorTop(
              message: "⚠️⚠️⚠️⚠️⚠️ onCancel ⚠️⚠️⚠️⚠️⚠️");

          context.pop();
        },
      ),
    ));
  }
}
