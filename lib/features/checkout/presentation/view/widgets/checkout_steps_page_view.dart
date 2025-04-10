import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/address_input_section.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/shipping_section.dart';

import 'payment_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

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
      const AddressInputSection(),
      const PaymentSection(),
    ];
  }
}
