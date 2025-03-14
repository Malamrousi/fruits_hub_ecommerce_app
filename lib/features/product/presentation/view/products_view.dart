import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/product/product_cubit.dart';
import 'package:fruit_hub/core/services/get_it_services.dart';


import '../../../../core/repo/product_repo/product_repo.dart';
import 'widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        getIT.get<ProductsRepo>(),
      ),
      child: const ProductsViewBody(),
    );
  }
}