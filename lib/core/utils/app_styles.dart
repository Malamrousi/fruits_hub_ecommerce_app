import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/color_manger.dart';
import 'package:fruit_hub/core/utils/font_weight_manger.dart';

class AppStyles {
  static TextStyle font23BlackBold = const TextStyle(
    fontSize: 23,
    fontWeight: FontWeightManger.bold,
    color: ColorManger.grayScaleColor,
  );

  static TextStyle font13stoneGraySemiBold = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeightManger.semiBold,
    color: ColorManger.stoneGrayColor,
  );
    static TextStyle font23sPrimaryColorBold = const TextStyle(
    fontSize:23,
    fontWeight: FontWeightManger.bold,
    color: ColorManger.primaryColor,
  );
      static TextStyle font23GoldenBold = const TextStyle(
    fontSize:23,
    fontWeight: FontWeightManger.bold,
    color: ColorManger.goldenColor,
  );
        static TextStyle font16WhiteBold = const TextStyle(
    fontSize:16,
    fontWeight: FontWeightManger.bold,
    color: ColorManger.whiteColor,
  );
}
