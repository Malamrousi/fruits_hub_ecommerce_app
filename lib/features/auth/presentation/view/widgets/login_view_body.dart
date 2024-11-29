import 'package:flutter/material.dart';
import 'package:fruit_hub/core/func/is_arabic.dart';
import 'package:fruit_hub/core/helper/extension.dart';
import 'package:fruit_hub/core/helper/spacing.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/color_manger.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/custom_divider.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/custom_social_auth.dart';

import '../../../../../constant.dart';
import '../../../../../core/routing/route_name.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_filed.dart';
import '../../../../../generated/l10n.dart';
import 'dont_have_an_account.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool obscureTextIcon  = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            verticalSpacing(24),
            CustomTextFormFiled(
              obscureText: obscureTextIcon,
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              hintText: S.of(context).email_hint,
              validator: (value) {},
            ),
            verticalSpacing(16),
            CustomTextFormFiled(
               suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  obscureTextIcon = !obscureTextIcon;
                });
              },
              child:  Icon(
               obscureTextIcon ? Icons.visibility_off : Icons.visibility ,
                color: ColorManger.dustyGray,
                size: 22,
              ),
            ),
              obscureText:obscureTextIcon ,
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
             UserHaveAccountOrNot(
              account: S.of(context).dont_have_account,
              account2: S.of(context).signup,
              onTap: () {
                context.pushNamed(RouteName.signUp);
              },
            ),
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
