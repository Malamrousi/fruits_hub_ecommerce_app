import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/view/widgets/home_view.dart';

import '../../../../cart/presentation/view/cart_view.dart';
import '../../../../product/presentation/view/products_view.dart';
import '../../../../profile/presentation/view/profile_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: IndexedStack(
      index: currentViewIndex,
      children: const [
        HomeView(),
        ProductsView(),
        CartView(),
        ProfileView()
      ],
    ),);
  }
}
