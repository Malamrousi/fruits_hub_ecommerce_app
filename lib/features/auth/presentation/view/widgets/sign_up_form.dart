import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper/spacing.dart';
import '../../../../../core/helper/app_regx.dart';
import '../../../../../core/utils/color_manger.dart';
import '../../../../../core/widgets/custom_text_form_filed.dart';
import '../../../../../generated/l10n.dart';
import '../../cubits/cubit/signup_cubit.dart';
class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool obscureTextIcon  = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          // Name field validation
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
          CustomTextFormFiled(
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  obscureTextIcon  = !obscureTextIcon ;
                });
              },
              child:  Icon(
               obscureTextIcon  ? Icons.visibility_off : Icons.visibility ,
                color: ColorManger.dustyGray,
                size: 22,
              ),
            ),
            obscureText: obscureTextIcon ,
            controller: context.read<SignupCubit>().passwordController,
            keyboardType: TextInputType.text,
            hintText: S.of(context).password_hint,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).password_empty;
              }
              if (!AppRegex.hasMinLength(value)) {
                return S.of(context).password_length;
              }
              if (!AppRegex.hasLowerCase(value)) {
                return S.of(context).password_lowercase;
              }
              if (!AppRegex.hasUpperCase(value)) {
                return S.of(context).password_uppercase;
              }
              if (!AppRegex.hasNumber(value)) {
                return S.of(context).password_number;
              }
              if (!AppRegex.hasSpecialCharacter(value)) {
                return S.of(context).password_special;
              }
              if (value !=
                  context.read<SignupCubit>().passwordController.text) {
                return S.of(context).password_no_match;
              }
              return null;
            },
          ),
          verticalSpacing(16),
        
        ],
      ),
    );
  }
}
