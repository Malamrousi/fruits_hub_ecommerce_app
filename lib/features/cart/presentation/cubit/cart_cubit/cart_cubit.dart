import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_entity.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity(cartItems: []);

  void addProduct({required ProductEntity productEntity}) {
    bool isProductExists = cartEntity.isExists(productEntity: productEntity);
    var cartItems = cartEntity.getCartItem(productEntity: productEntity);
    if (isProductExists) {
      cartItems.incrementCount();
    } else {
      cartEntity.addCartItem(cartItemEntity: cartItems);
    }
    emit(
      CartProductAdd(),
    );
  }
}
