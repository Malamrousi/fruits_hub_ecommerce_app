import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/services/data_base_services.dart';
import 'package:fruit_hub/features/checkout/data/model/order_model.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/back_end_end_points.dart';
import '../../domain/repo/orders_repo.dart';

class OrdersRepoImpl extends OrdersRepo {
  final DatabaseService databaseService;
  OrdersRepoImpl({required this.databaseService});
  @override
  Future<Either<Failures, void>> addOrder(
      {required OrderEntity orderEntity}) async {
    try {
   final result =   await databaseService.addData(
          path: BackendEndpoint.addOrderEndpoint,
          data: OrderModel.fromEntity(orderEntity).toJson());
      return right(result);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
