import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/app_images.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(Assets.imagesUserAppBarImagesvg),
      title: Column(
        children: [
          Text(
           S.of(context).home,
            style: AppStyles.font20BlackBold,
          ),
        ],
      ),
      trailing: SvgPicture.asset(Assets.imagesNotificationAppBarImagesvg),
    );
  }
}