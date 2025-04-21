import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quanitty;

  CartItemEntity({required this.productEntity, this.quanitty = 1});

  num calculateTotalPrice() {
    return productEntity.price * quanitty;
  }

  num calculateTotalWeight() {
    return quanitty;
  }

  int incrementCount() {
    quanitty += 1;
    return quanitty;
  }

  int decrementCount() {
    quanitty -= 1;
    return quanitty;
  }
  
  @override
  List<Object?> get props => [productEntity];
}
