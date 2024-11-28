import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: S.of(context).dont_have_account, 
        style: AppStyles.font15DustyGrayScaleBold,
        children: <TextSpan>[
          
          TextSpan(
            style: AppStyles.font15sPrimaryColorBold,
            text: S.of(context).create_account,
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
