import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_services.dart';
import 'package:fruit_hub/features/cart/presentation/view/widgets/cart_view_body.dart';

import '../cubit/cart_item/cart_item_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIT.get<CartItemCubit>(),
      child: const CartViewBody(),
    );
  }
}
