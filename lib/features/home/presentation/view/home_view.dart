import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/view/widgets/custom_bottom_nav_bar.dart';
import 'package:fruit_hub/features/home/presentation/view/widgets/home_view_body.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomeViewBody()),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}