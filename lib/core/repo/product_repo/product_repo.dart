import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/errors/failures.dart';



abstract class ProductsRepo {
  Future<Either<Failures, List<ProductEntity>>> getProducts();
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts();
}