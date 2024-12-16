import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/errors/failures.dart';

abstract class ProductRepo {
  Future<Either<Failures,List< ProductEntity>>> getProduct();  
  Future<Either<Failures, List< ProductEntity>>> getBestSellingProduct();  
}
