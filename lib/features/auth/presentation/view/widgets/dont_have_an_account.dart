import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';


class UserHaveAccountOrNot extends StatelessWidget {
  const UserHaveAccountOrNot({super.key, required this.account, required this.account2, required this.onTap});
  final String account;
  final String account2;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: account, 
        style: AppStyles.font15DustyGrayScaleBold,
        children: <TextSpan>[
          
          TextSpan(
            style: AppStyles.font15PrimaryColorBold,
            text: account2,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
