// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fruit_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/shipping_address_entity.dart';

class OrderEntity {
 final List<CartItemEntity> cartItems;
 final bool payWidthCash;
 final ShippingAddressEntity shippingAddressEntity;
  OrderEntity({
    required this.cartItems,
    required this.payWidthCash,
    required this.shippingAddressEntity,
  });
 }
