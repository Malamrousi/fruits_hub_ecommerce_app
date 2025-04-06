import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/cart/presentation/view/widgets/cart_item_action_buttons.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../domain/entities/cart_item_entity.dart';
import '../../cubit/cart_cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
            child: CachedNetworkImage(
              imageUrl: cartItemEntity.productEntity.imageUrl ?? '',
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      cartItemEntity.productEntity.name,
                      style: AppStyles.font16GrayScaleBold,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().removeProduct(
                              cartItemEntity: cartItemEntity,
                            );
                      },
                      child: SvgPicture.asset(
                        Assets.imagesTrash,
                      ),
                    )
                  ],
                ),
                Text(
                  '${cartItemEntity.calculateTotalWeight()} كم',
                  textAlign: TextAlign.right,
                  style: AppStyles.font13GoldenColorSemiBold,
                ),
                Row(
                  children: [
                     CartItemActionButtons(
                       cartItemEntity: cartItemEntity,
                     ),
                    const Spacer(),
                    Text(
                      '${cartItemEntity.calculateTotalPrice()} جنيه ',
                      style: AppStyles.font16GoldenColorBold,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
