import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/utils/color_manger.dart';

import '../../features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline),
            ),
          ),
          Positioned.fill(
              top: 30,
              child: Column(
            children: [
              Flexible(
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: productEntity.imageUrl ?? '',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) =>const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  productEntity.name,
                  style: AppStyles.font13stoneGraySemiBold,
                ),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${productEntity.price} جنيه ",
                        style: AppStyles.font13GoldenColorBold,
                      ),
                      TextSpan(
                        text: 'الكيلو',
                        style: AppStyles.font13GoldenColorSemiBold,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
                trailing: CircleAvatar(
                  backgroundColor: ColorManger.primaryColor,
                  child: IconButton(
                      onPressed: () {
                        context.read<CartCubit>().addProduct(productEntity: productEntity);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: ColorManger.whiteColor,
                      )),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
