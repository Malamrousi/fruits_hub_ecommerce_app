import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/cart/presentation/view/widgets/cart_item_list.dart';
import 'package:fruit_hub/features/cart/presentation/view/widgets/custom_cart_button.dart';
import 'package:fruit_hub/features/cart/presentation/view/widgets/custom_divider.dart';

import '../../cubit/cart_cubit/cart_cubit.dart';
import 'cart_header.dart';
import 'cart_view_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(slivers: [
          const SliverToBoxAdapter(
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
            child: context.read<CartCubit>().cartEntity.cartItems.isNotEmpty
                ? const CustomCartDivider()
                : const SizedBox.shrink(),
          ),
           CartItemList(
            cartItems: context.watch<CartCubit>().cartEntity.cartItems,
          ),
          SliverToBoxAdapter(
            child: context.read<CartCubit>().cartEntity.cartItems.isNotEmpty
                ? const CustomCartDivider()
                : const SizedBox.shrink(),
          ),
        ]),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * .07,
          child:const CustomCartButton(),
        ),
      ],
    );
  }
}

