import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/checkout/domain/repo/orders_repo.dart';

import '../../../domain/entities/order_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit({required this.ordersRepo}) : super(AddOrderInitial());
  final OrdersRepo ordersRepo;

  void addOrder({required OrderEntity orderEntity}) async {
    emit(AddOrderLoading());
    final result = await ordersRepo.addOrder(orderEntity: orderEntity);
    result.fold(
      (failure) => emit(AddOrderFailure(errorMessage:failure.message )),
      (success) => emit(AddOrderSuccess()),
    );
  }
}
