import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  addCartItem({required CartItemEntity cartItemEntity}) {
    cartItems.add(cartItemEntity);
  }

 removeCartItem({required CartItemEntity cartItemEntity}) {
   cartItems.remove(cartItemEntity);
 }
  bool isExists({required ProductEntity productEntity}) {
    for (var item in cartItems) { 
      if (item.productEntity == productEntity) {
       return true; 
      }
    }
    return false;
  }
  double getTotalPrice() {
    double totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.calculateTotalPrice();
    }
    return totalPrice;
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
