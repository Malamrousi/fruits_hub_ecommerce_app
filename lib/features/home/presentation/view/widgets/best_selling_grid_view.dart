import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/fruit_item.dart';

import '../../../../../core/entities/product_entity.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return  SliverGrid.builder(
      itemCount: 10,
      gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163/250,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        ),
      itemBuilder: (context, index) {
        return const FruitItem();
      },
    );
  }
}