import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper/spacing.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/custom_text_form_filed.dart';
import '../../../domain/entities/order_entity.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key, required this.formKey, required this.valueListenable});
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable:valueListenable ,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              verticalSpacing(
                24,
              ),
              CustomTextFormFiled(
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ادخل الاسم كامل';
                  }
                },
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.name =
                      value;
                },
              ),
              verticalSpacing(
                16,
              ),
              CustomTextFormFiled(
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ادخل البريد الإلكتروني';
                  }
                },
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.email =
                      value;
                },
              ),
              verticalSpacing(
                16,
              ),
              CustomTextFormFiled(
                hintText: 'العنوان',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ادخل العنوان';
                  }
                },
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.address =
                      value;
                },
              ),
              verticalSpacing(
                16,
              ),
              CustomTextFormFiled(
                hintText: 'المدينه',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ادخل المدينه';
                  }
                },
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.city =
                      value;
                },
              ),
              verticalSpacing(
                16,
              ),
              CustomTextFormFiled(
                hintText: 'رقم الطابق , رقم الشقه ..',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ادخل رقم الطابق , رقم الشقه ..';
                  }
                },
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.floor =
                      value;
                },
              ),
              verticalSpacing(
                16,
              ),
              CustomTextFormFiled(
                hintText: 'رقم الهاتف',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ادخل رقم الهاتف';
                  }
                },
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddressEntity!.phone =
                      value;
                },
              ),
              verticalSpacing(
                16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
