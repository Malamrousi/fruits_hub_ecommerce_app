import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const ShapeDecoration(
        shape: OvalBorder(),
        color: Color(0xffEEF8ED),
      ),
      child: Image.asset(Assets.imagesNotification),
    );
  }
}
