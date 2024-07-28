import 'package:flutter/material.dart';

class AppColors {
  //----------------------------------------------- For App
  static const Color colorPrimary = Color(0xFF5f33e1);
  static const Color colorPrimaryText = Color(0xff24252C);
  static const Color colorsBackGround = Colors.white;

  //------------------------------------------------------------- for Texts

  static const Color colorsText1 = Colors.black;
  static const Color colorsText2 = Colors.white;
  static const Color colorsText3 = Color(0xFF6E6A7C);
  static const Color colorsText4 = Color(0xFF5F33E1);

  //------------------------------------------------------------- for TextField
  static const Color colorsNumberColor = Color(0xFFBABABA); // for phone number
  static const Color colorTextField = Color(0xFF7F7F7F);
  static const Color colorTextFieldBorder = Color(0xFFBABABA);
  static const Color colorsControlTextField = Colors.transparent;

  //------------------------------------------------------- For Buttons
  static const Color colorsBackGroundButtons = colorPrimary;
  static const Color colorsTextButtons = Colors.white;
  static const Color colorsButtonsPri = colorPrimary;
  static const Color colorsButtonsSec = Colors.white;

  //----------------------------------------------------------- App Bar
  static const Color colorBackgroundAppBar = Colors.transparent;
  static const Color colorBackgroundLight = colorPrimary;

  static const Color colorIcon = Colors.black;

// // for Line
  static const Color colorLineSeparated = Color(0xffD5DDE0);
  static const Color colorTextLineSeparated = Color(0xff3E4958);

// Navigation
  static const Color colorSelected = Color(0xff4A5562);
  static const Color colorUnSelected = Color(0xff97ADB6);
  //  in profile
  static const Color colorBackGroundInFieldsProfile = Color(0xffF5F5F5);
  static const Color colorTitleInProfile = Color(0xff2F2F2F);
  static const Color colorTextInProfile = Color(0xff2F2F2F);

}

//----------------------------------------------
enum ToastStates { error, warning, succeed }

Color choseToastColor(ToastStates state) {
  switch (state) {
    case ToastStates.succeed:
      return Colors.green;
    case ToastStates.error:
      return Colors.red;
    case ToastStates.warning:
      return Colors.amber;
  }
}
