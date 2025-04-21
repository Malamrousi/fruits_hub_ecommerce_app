import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/checkout/presentation/cubit/add_order_cubit/add_order_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utils/show_toast.dart';

class AddOrderBlocConsumer extends StatelessWidget {
  const AddOrderBlocConsumer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          ShowToast.showToastSuccessTop(message: "تم اضافة الطلب بنجاح");
        }
        if (state is AddOrderFailure) {
          ShowToast.showToastErrorTop(message: "حدث خطأ في اضافة الطلب");
        }
      },
      builder: (context, state) {
       
        return ModalProgressHUD(inAsyncCall: state is AddOrderLoading, child: child);
      },
    );
  }
}
