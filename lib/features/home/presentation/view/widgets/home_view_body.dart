import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/cubits/product/product_cubit.dart';
import 'package:fruit_hub/core/helper/spacing.dart';
import 'package:fruit_hub/core/widgets/search_text_filed.dart';
import 'package:fruit_hub/features/home/presentation/view/widgets/best_seller_header.dart';
import 'package:fruit_hub/features/home/presentation/view/widgets/feature_list.dart';
import 'package:fruit_hub/features/home/presentation/view/widgets/home_app_bar.dart';

import 'best_selling_grid_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getBestSellingProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 16, horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const HomeAppBar(),
                verticalSpacing(16),
                const SearchTextField(),
                verticalSpacing(12),
                const FeatureList(),
                verticalSpacing(12),
                const BestSellerHeader(),
                verticalSpacing(8),
              ],
            ),
          ),
          const BestSellingGridView(),
        ],
      ),
    );
  }
}
