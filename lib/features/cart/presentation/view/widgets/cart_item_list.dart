import 'package:flutter/material.dart';
import 'package:fruit_hub/features/cart/presentation/view/widgets/cart_item.dart';
import 'package:fruit_hub/features/cart/presentation/view/widgets/custom_divider.dart';

import '../../../domain/entities/cart_item_entity.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const CustomCartDivider(),
      itemCount: cartItems.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CartItem(
          cartItemEntity: cartItems[index],
        ),
      ),
    );
  }
}
