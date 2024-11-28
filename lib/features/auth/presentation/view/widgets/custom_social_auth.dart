import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/color_manger.dart';

class CustomSocialAuth extends StatelessWidget {
  const CustomSocialAuth(
      {super.key,
      this.borderRadius,
      required this.buttonText,
      this.textStyle,
      this.onPressed,
      this.bottomHeight,
      this.bottomWidth,
      required this.socialImage});

  final double? borderRadius;
  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final double? bottomHeight;
  final double? bottomWidth;
  final String socialImage;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll<Size>(
            Size(bottomWidth ?? double.maxFinite, bottomHeight ?? 48)),
        backgroundColor:
            const WidgetStatePropertyAll<Color>(Colors.transparent),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16),
            side: const BorderSide(color: ColorManger.grayColor),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              socialImage,
              height: 24,
              width: 24,
            ),
            Expanded(
              child: Center(
                child: Text(
                  buttonText,
                  style: textStyle ?? AppStyles.font16GrayScaleSemiBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
