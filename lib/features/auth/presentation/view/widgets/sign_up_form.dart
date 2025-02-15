import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper/spacing.dart';
import 'package:fruit_hub/core/widgets/custom_password_filed.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import '../../../../../core/helper/app_regx.dart';
import '../../../../../core/widgets/custom_text_form_filed.dart';

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
            hintText: "الاسم",
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "الاسم مطلوب";
              }
              if (!AppRegex.isNameValid(value)) {
                return "الاسم غير صحيح";
              }
              return null;
            },
          ),
          verticalSpacing(16),
          CustomTextFormFiled(
            obscureText: false,
            controller: context.read<SignupCubit>().emailController,
            keyboardType: TextInputType.emailAddress,
            hintText:"البريد الالكتروني",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "البريد الالكتروني مطلوب";
              }
              if (!AppRegex.isEmailValid(value)) {
                return "البريد الالكتروني غير صحيح";
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