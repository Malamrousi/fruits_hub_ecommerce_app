import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/color_manger.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../cubit/cart_item/cart_item_cubit.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          iconColor: Colors.white,
          icon: Icons.add,
          color: ColorManger.primaryColor,
          onPressed: () {
            cartItemEntity.incrementCount();
            context
                .read<CartItemCubit>()
                .updateCartItem(cartItemEntity: cartItemEntity);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            cartItemEntity.count.toString(),
            textAlign: TextAlign.center,
            style: AppStyles.font16GrayScaleBold,
          ),
        ),
        CartItemActionButton(
          iconColor: Colors.grey,
          icon: Icons.remove,
          color: const Color(0xFFF3F5F7),
          onPressed: () {
            cartItemEntity.decrementCount();
            context
                .read<CartItemCubit>()
                .updateCartItem(cartItemEntity: cartItemEntity);
          },
        )
      ],
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton(
      {super.key,
      required this.icon,
      required this.color,
      required this.onPressed,
      required this.iconColor});

  final IconData icon;
  final Color iconColor;
  final Color color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 24,
        height: 24,
        padding: const EdgeInsets.all(
          2,
        ),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: FittedBox(
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
