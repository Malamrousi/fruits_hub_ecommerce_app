import 'package:flutter/material.dart';

import '../utils/color_manger.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.borderRadius,
      this.backgroundColor,
      this.textStyle,
      this.bottomHeight,
      this.bottomWidth,
      this.borderColor});
  final double? borderRadius;
  final Color? backgroundColor;

  final String title;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final double? bottomHeight;
  final double? bottomWidth;

  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll<Size>(
            Size(bottomWidth ?? double.maxFinite, bottomHeight ?? 48)),
        backgroundColor: WidgetStatePropertyAll<Color>(
            backgroundColor ?? Colors.transparent),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 4),
            side: BorderSide(color: borderColor ?? ColorManger.primaryColor),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
