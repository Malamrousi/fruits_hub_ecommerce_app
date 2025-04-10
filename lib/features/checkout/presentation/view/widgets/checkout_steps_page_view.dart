import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/address_input_section.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/shipping_section.dart';

import 'payment_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView(
      {super.key,
      required this.pageController,
      required this.formKey,
      required this.valueListenable});

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return getPages()[index];
        },
        itemCount: getPages().length,
      ),
    );
  }

  List<Widget> getPages() {
    return [
      const ShippingSection(),
      AddressInputSection(
        formKey: formKey,
        valueListenable: valueListenable,
      ),
       PaymentSection(
        pageController:pageController ,
      ),
    ];
  }
}
