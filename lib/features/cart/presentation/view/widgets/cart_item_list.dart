import 'package:flutter/material.dart';
import 'package:fruit_hub/features/cart/presentation/view/widgets/cart_item.dart';
import 'package:fruit_hub/features/cart/presentation/view/widgets/custom_divider.dart';


class CartItemList extends StatelessWidget {
  const CartItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const CustomCartDivider(),
      itemCount: 10,
      itemBuilder: (context, index) =>const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16),
        child:  CartItem(),
      ),
    );
  }
}
