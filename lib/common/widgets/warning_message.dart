import 'package:to_let_mobile_app/utils/app_color.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showWarningMessage({String? message}) async =>
    Fluttertoast.showToast(
        msg: "$message",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColor.primaryOrange,
        textColor: AppColor.cardColor,
        fontSize: 16.0
    );
