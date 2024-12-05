import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/fruit_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverGrid.builder(
      itemCount: 10,
      gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163/214,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        ),
      itemBuilder: (context, index) {
        return const FruitItem();
      },
    );
  }
}