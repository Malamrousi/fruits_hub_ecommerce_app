import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper/extension.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

import '../../../../../core/routing/route_name.dart';

class BestSellerHeader extends StatelessWidget {
  const BestSellerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
         "الاكثر مبيعا " ,
          style: AppStyles.font16GrayScaleBold,
        ),
        InkWell(
          onTap: () async {
     
            context.pushNamed(RouteName.bestSelling);
          },
          child: Text(
         "المزيد" ,
            style: AppStyles.font13stoneGraySemiBold,
          ),
        ),
      ],
    );
  }
}

