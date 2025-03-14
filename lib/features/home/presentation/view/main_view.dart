import 'package:flutter/material.dart';
import 'package:fruit_hub/features/cart/presentation/view/cart_view.dart';

import '../../../product/presentation/view/products_view.dart';
import '../../../profile/presentation/view/profile_view.dart';
import 'widgets/custom_bottom_navigation_bar.dart';
import 'widgets/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'home_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          currentViewIndex = index;

          setState(() {});
        },
      ),
      body: SafeArea(child: getCurrentView()),
    );
  }

  Widget getCurrentView() {
    return [
      const HomeView(),
      const ProductsView(),
      const CartView(),
     const ProfileView()
    ][currentViewIndex];
  }
}