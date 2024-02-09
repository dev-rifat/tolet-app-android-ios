
import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showErrorMessage({required String message}) async =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColor.errorColor,
        textColor: AppColor.cardColor,
        fontSize: 16.0
    );
