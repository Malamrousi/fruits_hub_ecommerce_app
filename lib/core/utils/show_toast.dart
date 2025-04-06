import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruit_hub/core/utils/color_manger.dart';

class ShowToast {
  const ShowToast._();

  static void showToastErrorTop({
    required String message,
    int? seconds,
  }) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: seconds ?? 3,
        backgroundColor: ColorManger.redColor,
        textColor: ColorManger.whiteColor,
        fontSize: 16,
      );

  static void showToastSuccessTop({
    required String message,
    int? seconds,
  }) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: seconds ?? 3,
        backgroundColor: ColorManger.lightPrimaryColor,
        textColor: ColorManger.whiteColor,
        fontSize: 16,
      );
}