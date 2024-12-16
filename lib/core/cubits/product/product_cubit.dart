import 'package:bloc/bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/repo/product_repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());
  final ProductRepo productRepo;

  Future<void> getProduct() async {
    emit(ProductLoading());
    final result = await productRepo.getProduct();
    result.fold(
      (failure) => emit(ProductFailure(message: failure.message)),
      (product) => emit(
        ProductSuccess(products: product),
      ),
    );
  }

  Future<void> getBestSellingProduct() async {
    emit(ProductLoading());
    final result = await productRepo.getBestSellingProduct();
    result.fold(
      (failure) => emit(ProductFailure(message: failure.message)),
      (product) => emit(
        ProductSuccess(products: product),
      ),
    );
  }
}
