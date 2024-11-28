import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

import '../../../../../constant.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../generated/l10n.dart';
import 'custom_check_box.dart';

class TermAndCondition extends StatefulWidget {
  const TermAndCondition({super.key});

  @override
  State<TermAndCondition> createState() => _TermAndConditionState();
}

class _TermAndConditionState extends State<TermAndCondition> {
  bool isTermAccept = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         CustomCheckBox(
          onChanged: (value) {
            setState(() {
              isTermAccept = value;
            });
          },
          isChecked: isTermAccept,
        ),
        horizontalSpacing(16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: S.of(context).terms_text_start,
                  style: AppStyles.font13stoneGraySemiBold,
                ),
                TextSpan(
                  text: '  ',
                  style: AppStyles.font13stoneGraySemiBold,
                ),
                TextSpan(
                  text: S.of(context).terms_text_terms,
                  style: AppStyles.font13sLightPrimaryColorBold,
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
                TextSpan(
                  text: ' ',
                  style: AppStyles.font13stoneGraySemiBold,
                ),
                TextSpan(
                  text: S.of(context).terms_text_end,
                  style: AppStyles.font13sLightPrimaryColorBold,
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        )
      ],
    );
  }
}
