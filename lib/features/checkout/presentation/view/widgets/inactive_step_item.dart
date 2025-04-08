

import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/utils/app_styles.dart';

class InactiveStepItem extends StatelessWidget {
  const InactiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
          CircleAvatar(
          radius: 11.5,
          backgroundColor: const Color(0XFFF2F3F3),
          child: Text(
            "1",
            style: AppStyles.font13stoneGraySemiBold,
          )
          
        ),
        horizontalSpacing(4),
        Text(
          
          "العنوان",
          style: AppStyles.font13stoneGraySemiBold.copyWith(
            color: const Color(0XFFAAAAAA),
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}