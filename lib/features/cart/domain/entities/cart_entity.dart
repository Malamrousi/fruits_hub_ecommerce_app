import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  addCartItem({required CartItemEntity cartItemEntity}) {
    cartItems.add(cartItemEntity);
  }

  bool isExists({required ProductEntity productEntity}) {
    for (var item in cartItems) { 
      if (item.productEntity == productEntity) {
       return true; 
      }
    }
    return false;
  }

  CartItemEntity getCartItem({required ProductEntity productEntity}) {
    for (var item in cartItems) {
      if (item.productEntity == productEntity) {
        return item;
      }
    }
    return CartItemEntity(productEntity: productEntity, count: 1);
  }
}
