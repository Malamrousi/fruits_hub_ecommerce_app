import 'package:flutter/material.dart';
import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_filed.dart';
import 'package:fruit_hub/generated/l10n.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/utils/color_manger.dart';
import 'term_and_condition.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            verticalSpacing(24),
            CustomTextFormFiled(
              validator: (value) {},
              hintText: S.of(context).name_hint,
            ),
            verticalSpacing(16),
            CustomTextFormFiled(
              obscureText: false,
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              hintText: S.of(context).email_hint,
              validator: (value) {},
            ),
            verticalSpacing(16),
            CustomTextFormFiled(
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility,
                    color: ColorManger.dustyGray,
                    size: 22,
                  )),
              obscureText: true,
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              hintText: S.of(context).password_hint,
              validator: (value) {},
            ),
            verticalSpacing(16),
            const TermAndCondition()
          ],
        ),
      ),
    );
  }
}
