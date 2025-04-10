import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/payment_item.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({
    super.key, required this.pageController,
  });
final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      tile: 'عنوان التوصيل',
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.imagesLocation,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            "${context.read<OrderEntity>().shippingAddressEntity}",
            textAlign: TextAlign.right,
            style: AppStyles.font13stoneGrayRegular,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              pageController.animateToPage(pageController.page!.toInt() - 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            },
            child: SizedBox(
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.imagesEdit,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text('تعديل', style: AppStyles.font13BlackSemiBold)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
