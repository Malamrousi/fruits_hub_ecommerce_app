import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_filed.dart';

import '../helper/app_regx.dart';
import '../utils/color_manger.dart';

class PasswordFiled extends StatefulWidget {
  const PasswordFiled({
    super.key,
    required this.passwordController,
  });
  final TextEditingController passwordController;
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
          setState(() {});
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
      hintText: "كلمة المرور",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "كلمة المرور مطلوب";
        }
        if (!AppRegex.hasMinLength(value)) {
          return "كلمة المرور يجب ان تكون على الاقل 8 حروف";
        }
        if (!AppRegex.hasLowerCase(value)) {
          return "كلمة المرور يجب ان تحتوي على حرف صغير";
        }
        if (!AppRegex.hasUpperCase(value)) {
          return "كلمة المرور يجب ان تحتوي على حرف كبير";
        }
        if (!AppRegex.hasNumber(value)) {
          return "كلمة المرور يجب ان تحتوي على رقم";
        }
        if (!AppRegex.hasSpecialCharacter(value)) {
          return "كلمة المرور يجب ان تحتوي على حرف خاص";
        }

        return null;
      },
    );
  }
}
