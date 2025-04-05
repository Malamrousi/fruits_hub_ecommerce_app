import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/cart/presentation/view/widgets/cart_item_list.dart';
import 'package:fruit_hub/features/cart/presentation/view/widgets/custom_divider.dart';

import 'cart_header.dart';
import 'cart_view_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomScrollView(
          slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CartViewHeader(),
                SizedBox(
                  height: 20,
                ),
                CartHeader(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: CustomCartDivider(),
          ),
          CartItemList(),
          SliverToBoxAdapter(
            child: CustomCartDivider(),
          ),
        ]),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * .07,
          child: CustomButton(
            title: 'الدفع  120جنيه',
            textStyle: AppStyles.font16WhiteBold,
            bottomHeight: 50,
             onPressed: () {  },
            
          ),
        ),
      ],
    );
  }
}
