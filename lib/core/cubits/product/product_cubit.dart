import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/repo/product_repo/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());
  final ProductsRepo productRepo;

  int productLength = 0;

  Future<void> getProduct() async {
    emit(ProductLoading());
    final result = await productRepo.getProducts();
    result.fold(
      (failure) => emit(ProductFailure(message: failure.message)),
      (product) => emit(
        ProductSuccess(products: product),
      ),
    );
  }

  Future<void> getBestSellingProduct() async {
    emit(ProductLoading());
    final result = await productRepo.getBestSellingProducts();
    result.fold((failure) => emit(ProductFailure(message: failure.message)),
        (product) {
      productLength = product.length;
      emit(
        ProductSuccess(products: product),
      );
    });
  }
}
