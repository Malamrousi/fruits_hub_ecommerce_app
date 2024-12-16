import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/models/product_model.dart';
import 'package:fruit_hub/core/repo/product_repo/product_repo.dart';
import 'package:fruit_hub/core/services/data_base_services.dart';
import 'package:fruit_hub/core/utils/back_end_end_points.dart';

class ProductRepoImpl extends ProductRepo {
  final DataBaseServices dataBaseServices;
  ProductRepoImpl({required this.dataBaseServices});
  @override
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProduct() async {
    try {
      var result = await dataBaseServices.getData(
          path: BackEndEndPoints.getProductEndPoint,
          query: {
            'limit': 10,
             'orderBy': 'sellingAmount',
             'descending': true
          }) as List<Map<String, dynamic>>;

      List<ProductModel> productModels =
          result.map((e) => ProductModel.fromJson(e)).toList();

      List<ProductEntity> productEntities =
          productModels.map((e) => e.toEntity()).toList();

      return Right(productEntities);
    } catch (e) {
      return left(ServerFailure(message: 'Failed to get products'));
    }
  }

  @override
  Future<Either<Failures, List<ProductEntity>>> getProduct() async {
    try {
      var result = await dataBaseServices.getData(
              path: BackEndEndPoints.getProductEndPoint)
          as List<Map<String, dynamic>>;

      List<ProductModel> productModels =
          result.map((e) => ProductModel.fromJson(e)).toList();

      List<ProductEntity> productEntities =
          productModels.map((e) => e.toEntity()).toList();

      return Right(productEntities);
    } catch (e) {
      return left(ServerFailure(message: 'Failed to get products'));
    }
  }
}
