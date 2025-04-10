// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fruit_hub/features/cart/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/shipping_address_entity.dart';

class OrderEntity {
 final CartEntity cartEntity;
  bool? payWidthCash;
  ShippingAddressEntity? shippingAddressEntity = ShippingAddressEntity();
  OrderEntity(

     this.cartEntity,
  
  {
     this.payWidthCash,
     this.shippingAddressEntity,
  }
    
  );
 }
