import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper/extension.dart';
import 'package:fruit_hub/core/routing/route_name.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_item/cart_item_cubit.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../cubit/cart_cubit/cart_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
          title:
              'الدفع ${context.watch<CartCubit>().cartEntity.getTotalPrice()} جنيه',
          textStyle: AppStyles.font16WhiteBold,
          bottomHeight: 50,
          onPressed: () {
            context.pushNamed(RouteName.checkout);
          },
        );
      },
    );
  }
}
