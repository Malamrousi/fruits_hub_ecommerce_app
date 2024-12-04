import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_hub/core/func/is_arabic.dart';
import 'package:fruit_hub/core/helper/spacing.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/home/presentation/view/widgets/feature_item_button.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: itemWidth - 32,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                left: isArabic() ? 0 : itemWidth * .4,
                bottom: 0,
                right:isArabic()? itemWidth * .4 : 0,
                top: 0,
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
                        fit: BoxFit.fill)),
                child: Padding(
                  padding: EdgeInsets.only(
                      right: isArabic() ? 33 : 0, left: isArabic() ? 0 : 33),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpacing(25),
                      Text(
                        'عروض العيد',
                        style: AppStyles.font13WhiteColorRegular,
                      ),
                      verticalSpacing(8),
                      const Spacer(),
                      Text(
                        S.of(context).discount,
                        style: AppStyles.font19WhiteColorBold,
                      ),
                      verticalSpacing(11),
                      const FeatureItemButton(),
                      verticalSpacing(20),
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
