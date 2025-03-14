import 'package:flutter/material.dart';

import '../../../../../core/widgets/search_text_filed.dart';
import '../../../../home/presentation/view/widgets/best_selling_grid_view_bloc_builder.dart';
import 'custom_home_app_bar.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const CustomHomeAppBar(),
                const SizedBox(
                  height: 16,
                ),
                const SearchTextField(),
                const SizedBox(
                  height: 12,
                ),
                // ProductsViewHeader(
                //     productsLength:
                //         context.read<ProductsCubit>().productsLength),
                // const SizedBox(
                //   height: 8,
                // ),
              ],
            ),
          ),
          const BestSellingGridViewBlocBuilder()
        ],
      ),
    );
  }
}