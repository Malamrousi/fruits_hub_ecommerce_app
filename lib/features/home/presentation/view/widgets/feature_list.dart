import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/view/widgets/featured_item.dart';

class FeatureList extends StatelessWidget {
  const FeatureList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(4, (index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: FeaturedItem(),
          );
        }),
      ),
    );
  }
}
