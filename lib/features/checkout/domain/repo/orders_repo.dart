import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';

import '../entities/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failures, void>> addOrder({required OrderEntity orderEntity});
}