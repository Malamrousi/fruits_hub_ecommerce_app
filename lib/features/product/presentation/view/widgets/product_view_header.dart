import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class ProductViewHeader extends StatelessWidget {
  const ProductViewHeader({super.key, required this.productCount});
  final int productCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$productCount نتائج",
          style: AppStyles.font16GrayScaleBold,
        ),
        const Spacer(),
        InkWell(
          child: SvgPicture.asset(Assets.imagesFiltter2, height: 20, width: 20),
        )
      ],
    );
  }
}
