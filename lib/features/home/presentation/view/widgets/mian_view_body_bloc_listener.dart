import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/func/build_error_app_bar.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/home/presentation/view/widgets/main_view_body.dart';

class MainViewBodyBlocListener extends StatelessWidget {
  const MainViewBodyBlocListener({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartProductAdd) {
          buildErrorBar(context, "تم إضافة المنتج للسلة بنجاح");
        }
      },
     child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
