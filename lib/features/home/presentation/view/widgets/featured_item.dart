import 'package:flutter/material.dart';

import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

import '../../../../../core/utils/app_styles.dart';
import 'feature_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                right: itemWidth * .4,
                child: Image.asset(
                  Assets.imagesStrawberry,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: itemWidth * .5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: svg.Svg(
                      Assets.imagesFeatureShape,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 33,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Text('عروض العيد',
                          style: AppStyles.font13WhiteColorRegular),
                      const Spacer(),
                      Text('خصم 25%', style: AppStyles.font13WhiteColorRegular),
                      const SizedBox(
                        height: 11,
                      ),
                   const   FeatureItemButton(),
                      const SizedBox(
                        height: 29,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
