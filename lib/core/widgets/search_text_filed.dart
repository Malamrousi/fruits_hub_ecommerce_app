import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/app_images.dart';

import '../../generated/l10n.dart';
import '../utils/app_styles.dart';
import '../utils/color_manger.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            spreadRadius: 0,
            blurRadius:9,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        autofocus: false,
      
        decoration: InputDecoration(
            suffixIcon: SizedBox(
              width: 20,
              height: 20,
              child: Center(
                child: SvgPicture.asset(Assets.imagesFiltter ),
              ),
            ),
            prefixIcon: SizedBox(
              width: 20,
              height: 20,
              child: Center(
                child: SvgPicture.asset(Assets.imagesSearch , ),
              ),
            ),
            filled: true,
            fillColor: ColorManger.cloudWhite,
            enabledBorder: inputBorder(),
            errorBorder: errorBorder(),
            focusedErrorBorder: errorBorder(),
            hintText: S.of(context).search_for,
            hintStyle: AppStyles.font13stoneGraySemiBold),
        style: AppStyles.font16GrayScaleBold,
      ),
    );
  }

  OutlineInputBorder inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: ColorManger.dustyGray, width: .3),
    );
  }

  OutlineInputBorder errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Colors.red, width: .8),
    );
  }
}
