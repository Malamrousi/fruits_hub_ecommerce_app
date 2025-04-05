import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/cart/presentation/view/widgets/cart_item_action_buttons.dart';

import '../../../../../core/utils/app_images.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

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
              imageUrl:
                  'https://th.bing.com/th/id/OIP.lkH9pwSB89Mq0OJ_v_rJAgHaFa?rs=1&pid=ImgDetMain',
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
                      'بطيخ',
                      style: AppStyles.font16GrayScaleBold,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        Assets.imagesTrash,
                      ),
                    )
                  ],
                ),
                Text(
                  '3 كم',
                  textAlign: TextAlign.right,
                  style: AppStyles.font13GoldenColorSemiBold,
                ),
                Row(
                  children: [
                    const CartItemActionButtons(),
                    const Spacer(),
                    Text(
                      '60 جنيه ',
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
