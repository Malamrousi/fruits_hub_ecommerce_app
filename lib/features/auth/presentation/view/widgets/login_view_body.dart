import 'package:flutter/material.dart';
import 'package:fruit_hub/core/func/is_arabic.dart';
import 'package:fruit_hub/core/helper/spacing.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/color_manger.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/custom_divider.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/custom_social_auth.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_filed.dart';
import '../../../../../generated/l10n.dart';
import 'dont_have_an_account.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            verticalSpacing(24),
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
            Align(
              alignment:
                  isArabic() ? Alignment.centerLeft : Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  S.of(context).forgot_password,
                  style: AppStyles.font13sLightPrimaryColorBold,
                ),
              ),
            ),
            verticalSpacing(16),
            CustomButton(
              onPressed: () {},
              title: S.of(context).login,
              textStyle: AppStyles.font16WhiteBold,
            ),
            verticalSpacing(33),
            const DontHaveAnAccount(),
            verticalSpacing(49),
            const CustomDivider(),
            verticalSpacing(33),
            CustomSocialAuth(
                buttonText: S.of(context).login_google,
                socialImage: Assets.imagesGoogle),
                  verticalSpacing(16),
                          CustomSocialAuth(
                buttonText: S.of(context).login_apple,
                socialImage: Assets.imagesApple),
                       verticalSpacing(16),
                          CustomSocialAuth(
                buttonText: S.of(context).login_facebook,
                socialImage: Assets.imagesFacebooksvg),
          ],
        ),
      ),
    );
  }
}
