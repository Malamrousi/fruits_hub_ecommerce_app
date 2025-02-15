import 'package:flutter/material.dart';
import 'package:fruit_hub/constant.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/notification_widget.dart';
import 'widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
    "الاكثر مبيعا " ,
          style: AppStyles.font16GrayScaleBold,
        ),
        actions: const [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: NotificationWidget(),
          ),
        ],
      ),
      body: const SafeArea(child: BestSellingViewBody()),
    );
  }
}