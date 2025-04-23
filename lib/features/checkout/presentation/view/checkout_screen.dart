import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/func/get_user.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/cart/domain/entities/cart_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/cubit/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/add_order_bloc_consumer.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/get_it_services.dart';
import '../../domain/entities/shipping_address_entity.dart';
import 'widgets/checkout_screen_view_body.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.cartEntity});
  final CartEntity cartEntity;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late OrderEntity orderEntity;
  @override
  void initState() {
    super.initState();
    orderEntity = OrderEntity(
        uId: getUser().uid,
        widget.cartEntity,
        shippingAddressEntity: ShippingAddressEntity());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIT.get<AddOrderCubit>(),
      child: Scaffold(
        appBar: buildAppBar(title: "الدفع", context: context),
        body: Provider.value(
            value: orderEntity,
            child: const AddOrderBlocConsumer(child: CheckoutScreenViewBody())),
      ),
    );
  }
}
