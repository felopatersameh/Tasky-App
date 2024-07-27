
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';


import '../../../Config/Route/route_app.dart';
import '../../Network/Local/cachehelper.dart';
import '../../Resources/colors.dart';
import '../../Resources/styles.dart';
   String? token ;



Future<void> singOut({
  required String key,
}) async{
  return await CashHelper.removeData(key: key);
}


void tapSkipOnboarding(context) {
   CashHelper.saveData(key: 'OnBoarding', value: true).then((value) => {
    if (value)
      {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.routeLogin, (route) => false)
      }
  });
}

// void showMessage({
//   required String text,
//   required ToastStates state,
// }) {
//   Fluttertoast.showToast(
//       msg: text,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 5,
//       backgroundColor: choseToastColor(state),
//       textColor: Colors.white,
//       fontSize: SizeFontManger.s20);
// }