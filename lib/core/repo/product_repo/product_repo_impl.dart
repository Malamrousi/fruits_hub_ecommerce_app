import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/models/product_model.dart';
import 'package:fruit_hub/core/repo/product_repo/product_repo.dart';
import 'package:fruit_hub/core/services/data_base_services.dart';
import 'package:fruit_hub/core/utils/back_end_end_points.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoint.getProducts,
          query: {
            'limit': 10,
            'orderBy': 'sellingCount',
            'descending': true
          }) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure( message: 'Failed to get products'));
    }
  }

  @override
  Future<Either<Failures, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoint.getProducts) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure(message:  'Failed to get products'));
    }
  }
}