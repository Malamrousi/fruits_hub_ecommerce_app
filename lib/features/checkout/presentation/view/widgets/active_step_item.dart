import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_hub/core/helper/spacing.dart';
import 'package:fruit_hub/core/utils/color_manger.dart';

import '../../../../../core/utils/app_styles.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 11.5,
          backgroundColor: ColorManger.primaryColor ,
          child: Icon(Icons.check,color: Colors.white,
          size: 16,),
          
        ),
        horizontalSpacing(4),
        Text(
          "الدفع",
          style: AppStyles.font13SBoldPrimaryColorBold,
        )
      ],
    );
  }
}