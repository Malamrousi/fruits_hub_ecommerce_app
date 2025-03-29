import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/fruit_item.dart';

import '../../../../../core/entities/product_entity.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, required this.products});
  final List<ProductEntity> products;
  
  @override
  Widget build(BuildContext context) {

    log(products.length.toString());
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 250,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return FruitItem(
          productEntity: products[index],
        );
      },
    );
  }
}
