import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/func/is_arabic.dart';
import 'package:fruit_hub/core/helper/extension.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_filed.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/view/widgets/dont_have_an_account.dart';
import 'package:fruit_hub/generated/l10n.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/routing/route_name.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'sign_up_form.dart';
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
            const SignUpForm(),
            verticalSpacing(16),
            const TermAndCondition(),
            verticalSpacing(30),
            CustomButton(
              onPressed: () {
                if (context
                    .read<SignupCubit>()
                    .formKey
                    .currentState!
                    .validate()) {
                  context.read<SignupCubit>().createUserWidthEmailAndPassword();
                }
              },
              title: S.of(context).create_account,
              textStyle: AppStyles.font16WhiteBold,
            ),
            verticalSpacing(33),
            UserHaveAccountOrNot(
              account: isArabic()
                  ? 'تمتلك حساب بالفعل؟ '
                  : 'Already have an account?',
              account2: S.of(context).login,
              onTap: () {
                context.pushNamed(RouteName.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
