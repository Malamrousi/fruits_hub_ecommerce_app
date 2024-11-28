import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/utils/color_manger.dart';

import '../../../../../generated/l10n.dart';


class TermAndCondition extends StatelessWidget {
  const TermAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
              value: false,
              onChanged: (value) {},
              checkColor: ColorManger.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: const BorderSide(color: ColorManger.dustyGray, width: .6)),
        ),
        Text.rich(
  TextSpan(
    children: [
       TextSpan(
        text: S.of(context).create_account,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 13,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w600,
          height: 1.7,
        ),
      ),
      TextSpan(
        text: 'الشروط',
        style: AppStyles.font13sLightPrimaryColorBold,
        recognizer: TapGestureRecognizer()
          ..onTap = () {
     
          },
      ),
       TextSpan(
        text: S.of(context).,
        style:  AppStyles.font13sLightPrimaryColorBold,
      ),
    ],
  ),
  textAlign: TextAlign.right,
)
      ],
    );
  }
}
