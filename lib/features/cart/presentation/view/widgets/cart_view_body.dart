import 'package:flutter/material.dart';

import 'cart_header.dart';
import 'cart_view_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CartViewHeader(),
          SizedBox(
            height: 20,
          ),
          CartHeader()
        ],
      ),
    );
  }
}
