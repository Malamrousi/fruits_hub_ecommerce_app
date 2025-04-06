import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/show_toast.dart';
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
        if (state is CartItemAdd) {
          ShowToast.showToastSuccessTop(message: "تم اضافة المنتج بنجاح",
          seconds: 1);
        }
        if (state is CartItemRemove) {
          ShowToast.showToastSuccessTop(message: "تم حذف المنتج بنجاح",
               seconds: 1);
        }
      },
     child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
