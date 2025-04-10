import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/shipping_item.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = 0;
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final orderEntity = context.read<OrderEntity>();
    return Column(
      children: [
        const SizedBox(
          height: 33,
        ),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 0;
              orderEntity.payWidthCash = true;
            });
          },
          iSelected: selectedIndex == 0,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price:
              "${context.read<OrderEntity>().cartEntity.getTotalPrice() + 40}",
        ),
        const SizedBox(
          height: 16,
        ),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
              orderEntity.payWidthCash = false;
            });
          },
          iSelected: selectedIndex == 1,
          title: 'الدفع اونلاين',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: "${context.read<OrderEntity>().cartEntity.getTotalPrice()}",
        ),
      ],
    );
  }
}
