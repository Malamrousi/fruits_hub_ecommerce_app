import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';

import 'widgets/checkout_screen_view_body.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "الدفع", context: context),
      body: const CheckoutScreenViewBody(),
    );
  }
}
