import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/product/product_cubit.dart';
import 'package:fruit_hub/core/helper/get_dummy_product.dart';
import 'package:fruit_hub/features/home/presentation/view/widgets/product_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/custom_error_widget.dart';

class ProductGridViewBlocBuilder extends StatelessWidget {
  const ProductGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return ProductGridView(
            products: state.products,
          );
        } else if (state is ProductFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              error: state.message,
            ),
          );
        } else {
          return Skeletonizer.sliver(
              enabled: true,
              child: ProductGridView(
                products: getDummyProducts(),
              ));
        }
      },
    );
  }
}
