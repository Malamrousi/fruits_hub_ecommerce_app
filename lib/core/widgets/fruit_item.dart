import 'package:flutter/material.dart';
import 'package:fruit_hub/core/func/is_arabic.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/utils/color_manger.dart';
import 'package:fruit_hub/generated/l10n.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

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
            right: isArabic() ? 0 : null,
            left: isArabic() ? null : 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline),
            ),
          ),
          Positioned.fill(
              child: Column(
            children: [
   
              Image.asset(Assets.imagesPineapple ,
              // fit: BoxFit.fill,
              width: 200,
              height: 150,
              ),
       
              ListTile(
                title: Text(
                  S.of(context).pineapple,
                  style: AppStyles.font13stoneGraySemiBold,
                ),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '30جنية /',
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
                trailing:        CircleAvatar(
                backgroundColor: ColorManger.primaryColor,
                child: IconButton(
                    onPressed: () {},
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
