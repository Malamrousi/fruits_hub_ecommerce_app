import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/payment_item.dart';
import 'package:provider/provider.dart';




class OrderSummryWidget extends StatelessWidget {
  const OrderSummryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      tile: 'ملخص الطلب',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style: AppStyles.font13stoneGrayRegular,
              ),
              const Spacer(),
               Text(
                '${context.read<OrderEntity>().cartEntity.getTotalPrice()} جنيه',
                textAlign: TextAlign.right,
                style: AppStyles.font16GrayScaleBold,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                'التوصيل  :',
                        style: AppStyles.font13stoneGrayRegular,

              ),
              const Spacer(),
              Text(
                '30جنية',
                textAlign: TextAlign.right,
                        style: AppStyles.font13stoneGrayRegular,

              )
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          const Divider(
            thickness: .5,
            color: Color(0xFFCACECE),
          ),
          const SizedBox(
            height: 9,
          ),
           Row(
            children: [
              Text(
                'الكلي',
                style: AppStyles.font16GrayScaleBold,
              ),
              Spacer(),
              Text(
                '${context.read<OrderEntity>().cartEntity.getTotalPrice() + 30} جنيه',
                style: AppStyles.font16GrayScaleBold,
              )
            ],
          ),
        ],
      ),
    );
  }
}