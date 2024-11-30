import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper/spacing.dart';
import 'package:fruit_hub/core/widgets/custom_password_filed.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_filed.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/cubit/login_cubit.dart';
import 'package:fruit_hub/generated/l10n.dart';

import '../../../../../core/helper/app_regx.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormFiled(
            obscureText: false,
            controller: context.read<LoginCubit>().emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: S.of(context).email_hint,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).email_empty;
              }
              if (!AppRegex.isEmailValid(value)) {
                return S.of(context).email_invalid;
              }
              return null;
            },
          ),
          verticalSpacing(16),
          PasswordFiled(
              passwordController:
                  context.read<LoginCubit>().passwordController),
        ],
      ),
    );
  }
}
