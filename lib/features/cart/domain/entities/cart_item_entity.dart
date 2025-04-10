import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count = 1});

  num calculateTotalPrice() {
    return productEntity.price * count;
  }

  num calculateTotalWeight() {
    return count;
  }

  int incrementCount() {
    count += 1;
    return count;
  }

  int decrementCount() {
    count -= 1;
    return count;
  }
  
  @override
  List<Object?> get props => [productEntity];
}
