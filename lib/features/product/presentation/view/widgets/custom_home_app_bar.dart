import 'package:flutter/material.dart';


import '../../../../../core/func/get_user.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/notification_widget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const NotificationWidget(),
      leading: Image.asset(Assets.imagesUserAppBar),
      title: Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
               style: AppStyles.font16GrayScaleBold,

      ),
      subtitle: Text(
        getUser().name,
        textAlign: TextAlign.right,
        style: AppStyles.font16GrayScaleBold,
      ),
    );
  }
}