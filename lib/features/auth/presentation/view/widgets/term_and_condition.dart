import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

import '../../../../../core/helper/spacing.dart';
import 'custom_check_box.dart';

class TermAndCondition extends StatefulWidget {
  const TermAndCondition({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

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
              widget.onChanged(value);
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
                  text:"من خلال إنشاء حساب ، فإنك توافق على",
                  style: AppStyles.font13stoneGraySemiBold,
                ),
            
                TextSpan(
                  text: ' ',
                  style: AppStyles.font13stoneGraySemiBold,
                ),
                TextSpan(
                  text: " الشروط والأحكام الخاصة بنا ",
                  style: AppStyles.font13SemiBoldPrimaryColorBold,
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
