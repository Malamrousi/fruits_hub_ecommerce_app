import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper/spacing.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/custom_text_form_filed.dart';
import '../../../domain/entities/order_entity.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            verticalSpacing(
              24,
            ),
            CustomTextFormFiled(
              hintText: 'الاسم كامل',
              keyboardType: TextInputType.text,
              validator: (value) {},
              onSaved: (value) {
                context.read<OrderEntity>().shippingAddressEntity!.name = value;
              },
            ),
            verticalSpacing(
              16,
            ),
            CustomTextFormFiled(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.text,
              validator: (value) {},
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
              validator: (value) {},
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
              validator: (value) {},
              onSaved: (value) {
                context.read<OrderEntity>().shippingAddressEntity!.city = value;
              },
            ),
            verticalSpacing(
              16,
            ),
            CustomTextFormFiled(
              hintText: 'رقم الطابق , رقم الشقه ..',
              keyboardType: TextInputType.text,
              validator: (value) {},
              onSaved: (value) {
                context
                    .read<OrderEntity>()
                    .shippingAddressEntity!
                    .floor = value;
              },
            ),
            verticalSpacing(
              16,
            ),
            CustomTextFormFiled(
              hintText: 'رقم الهاتف',
              keyboardType: TextInputType.number,
              validator: (value) {},
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
    );
  }
}
