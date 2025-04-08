import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/utils/color_manger.dart';

class FeatureItemButton extends StatelessWidget {
  const FeatureItemButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll<Size>(
            Size(double.infinity,  32)),
        backgroundColor: const WidgetStatePropertyAll<Color>(
          ColorManger.whiteColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular( 4),
            
          ),
        ),
      ),
      onPressed: (){},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          "تسوق الان",
          style: AppStyles.font13SemiBoldPrimaryColorBold,
        ),
      ),
    );
  }
}