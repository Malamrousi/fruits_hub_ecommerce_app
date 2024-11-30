import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper/spacing.dart';
import 'package:fruit_hub/core/widgets/custom_password_filed.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import '../../../../../core/helper/app_regx.dart';
import '../../../../../core/widgets/custom_text_form_filed.dart';
import '../../../../../generated/l10n.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          CustomTextFormFiled(
            controller: context.read<SignupCubit>().nameController,
            hintText: S.of(context).name_hint,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).name_empty;
              }
              if (!AppRegex.isNameValid(value)) {
                return S.of(context).name_invalid;
              }
              return null;
            },
          ),
          verticalSpacing(16),
          CustomTextFormFiled(
            obscureText: false,
            controller: context.read<SignupCubit>().emailController,
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
            passwordController: context.read<SignupCubit>().passwordController,
           ),
          verticalSpacing(16),
        ],
      ),
    );
  }
}