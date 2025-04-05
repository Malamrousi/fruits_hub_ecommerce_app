import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';

class CartViewHeader extends StatelessWidget {
  const CartViewHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        titleAlignment: ListTileTitleAlignment.center,
        title: Text(
          textAlign: TextAlign.center,
          "عربة التسوق",
          style: AppStyles.font19GrayScaleBold,
        ),
        leading: const IconButton(
          onPressed: null,
          icon: Icon(
            size: 22,
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ));
  }
}
