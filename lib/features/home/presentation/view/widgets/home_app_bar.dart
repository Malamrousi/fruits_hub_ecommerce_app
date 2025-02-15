import 'package:flutter/material.dart';
import 'package:fruit_hub/core/func/get_user.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/widgets/notification_widget.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {


    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(Assets.imagesUserAppBar),
      title: Text(
       "صباح الخير " ,
        style: AppStyles.font15DustyGrayScaleBold,
      ),
      subtitle: Text(
        getUser().name,
        style: AppStyles.font16GrayScaleBold,
      ),
      trailing: const NotificationWidget(),
    );
  }
}
