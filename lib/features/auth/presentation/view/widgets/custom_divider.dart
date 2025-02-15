import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/color_manger.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Expanded(
        child:  Divider(
        color: ColorManger.grayColor,
          thickness: .6,
        ),
      ),
      horizontalSpacing(12),
      Text(
       "او",
        style: AppStyles.font16GrayScaleBold,
      ),
      horizontalSpacing(12),
      const Expanded(
        child: Divider(
          color: ColorManger.grayColor,
          thickness: .6,
        ),
      ),
    ]);
  }
}
