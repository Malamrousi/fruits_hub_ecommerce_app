import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper/spacing.dart';

import '../../../../../core/widgets/custom_text_form_filed.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpacing(
            24,
          ),
          CustomTextFormFiled(
            hintText: 'الاسم كامل',
            keyboardType: TextInputType.text,
            validator: (value) {},
          ),
          verticalSpacing(
            16,
          ),
          CustomTextFormFiled(
            hintText: 'البريد الإلكتروني',
            keyboardType: TextInputType.text,
            validator: (value) {},
          ),
          verticalSpacing(
            16,
          ),
          CustomTextFormFiled(
            hintText: 'العنوان',
            keyboardType: TextInputType.text,
            validator: (value) {},
          ),
          verticalSpacing(
            16,
          ),
          CustomTextFormFiled(
            hintText: 'المدينه',
            keyboardType: TextInputType.text,
            validator: (value) {},
          ),
          verticalSpacing(
            16,
          ),
          CustomTextFormFiled(
            hintText: 'رقم الطابق , رقم الشقه ..',
            keyboardType: TextInputType.text,
            validator: (value) {},
          ),
          verticalSpacing(
            16,
          ),
          CustomTextFormFiled(
              hintText: 'رقم الهاتف',
              keyboardType: TextInputType.number,
              validator: (value) {}),
          verticalSpacing(
            16,
          ),
        ],
      ),
    );
  }
}
