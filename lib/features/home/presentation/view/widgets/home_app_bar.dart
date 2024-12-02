import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/generated/l10n.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Image.asset(Assets.imagesUserAppBar),
      title: Text(
       S.of(context).good_morning ,
        style: AppStyles.font15DustyGrayScaleBold,
      ),
      subtitle:   Text(
           S.of(context).user_name,
            style: AppStyles.font16GrayScaleBold,
          ),
      trailing: Container(
        padding: const EdgeInsets.all(16),
        decoration: const ShapeDecoration(
          shape: OvalBorder(),
          color: Color(0xffEEF8ED),
        ),
        child: Image.asset(Assets.imagesNotification),
      ),
    );
  }
}