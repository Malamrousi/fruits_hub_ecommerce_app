import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 33,
        ),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          iSelected: selectedIndex == 0,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: '40',
        ),
        const SizedBox(
          height: 16,
        ),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          iSelected: selectedIndex == 1,
          title: 'الدفع اونلاين',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: '40',
        ),
      ],
    );
  }
}
