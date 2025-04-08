

import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/utils/app_styles.dart';

class InactiveStepItem extends StatelessWidget {
  const InactiveStepItem({super.key, required this.text, required this.index});
 final String text;
 final String  index;
  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,

      children: [
          CircleAvatar(
          radius: 11.5,
          backgroundColor: const Color(0XFFF2F3F3),
          child: Text(
            index,
            style: AppStyles.font13stoneGraySemiBold,
          )
          
        ),
        horizontalSpacing(4),
        Text(
          
          text,
          style: AppStyles.font13stoneGraySemiBold.copyWith(
            color: const Color(0XFFAAAAAA),
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}