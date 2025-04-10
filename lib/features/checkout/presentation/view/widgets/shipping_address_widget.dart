import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/features/checkout/presentation/view/widgets/payment_item.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({
    super.key,
  });

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
            'شارع النيل، مبنى رقم ١٢٣',
            textAlign: TextAlign.right,
            style: AppStyles.font13stoneGrayRegular,
          ),
          const Spacer(),
          SizedBox(
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
          )
        ],
      ),
    );
  }
}
