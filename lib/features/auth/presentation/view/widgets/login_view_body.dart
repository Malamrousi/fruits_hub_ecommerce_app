import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper/extension.dart';
import 'package:fruit_hub/core/helper/spacing.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/custom_divider.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/custom_social_auth.dart';

import '../../../../../constant.dart';
import '../../../../../core/routing/route_name.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../cubits/cubit/login_cubit.dart';
import 'dont_have_an_account.dart';
import 'login_form.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            verticalSpacing(24),
            const LoginForm(),
            verticalSpacing(16),
            Align(
              alignment:
           Alignment.centerLeft ,
              child: TextButton(
                onPressed: () {},
                child: Text(
                 "نسيت كلمة المرور",
                  style: AppStyles.font13SemiBoldPrimaryColorBold,
                ),
              ),
            ),
            verticalSpacing(16),
            CustomButton(
              onPressed: () {
                if (context
                    .read<LoginCubit>()
                    .formKey
                    .currentState!
                    .validate()) {
                  context.read<LoginCubit>().loginUserWidthEmailAndPassword();
                }
              },
              title: "تسجيل الدخول", 
              textStyle: AppStyles.font16WhiteBold,
            ),
            verticalSpacing(33),
            UserHaveAccountOrNot(
              account: "ليس لديك حساب؟",
              account2: "تسجيل حساب جديد",
              onTap: () {
                context.pushNamed(RouteName.signUp);
              },
            ),
            verticalSpacing(49),
            const CustomDivider(),
            verticalSpacing(33),
            CustomSocialAuth(
              onPressed: () {
                context.read<LoginCubit>().loginWithGoogle();
              },
              buttonText: "تسجيل الدخول بواسطة جوجل",
              socialImage: Assets.imagesGoogle,
            ),
            verticalSpacing(16),
            CustomSocialAuth(
                onPressed: () {
                  context.read<LoginCubit>().loginWithFacebook();
                },
                buttonText: "تسجيل الدخول بواسطة فيسبوك",
                socialImage: Assets.imagesFacebooksvg),
            verticalSpacing(16),
            CustomSocialAuth(
                onPressed: () {
                  context.read<LoginCubit>().loginWithApple();
                },
                buttonText: "تسجيل الدخول بواسطة ابل",
                socialImage: Assets.imagesApple),
          ],
        ),
      ),
    );
  }
}
