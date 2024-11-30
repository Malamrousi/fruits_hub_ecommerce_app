import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_filed.dart';

import '../../generated/l10n.dart';
import '../helper/app_regx.dart';
import '../utils/color_manger.dart';

class PasswordFiled extends StatefulWidget {
  const PasswordFiled({
    super.key, required this.passwordController,
  });
  final TextEditingController passwordController ;
  @override
  State<PasswordFiled> createState() => _PasswordFiledState();
}

class _PasswordFiledState extends State<PasswordFiled> {
  bool obscureTextIcon = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormFiled(
      suffixIcon: GestureDetector(
        onTap: () {
           obscureTextIcon = !obscureTextIcon;
          setState(() {
          });
        },
        child: Icon(
          obscureTextIcon ? Icons.visibility_off : Icons.visibility,
          color: ColorManger.dustyGray,
          size: 22,
        ),
      ),
      obscureText: obscureTextIcon,
      controller: widget.passwordController,
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
        
        return null;
      },
    );
  }
}
