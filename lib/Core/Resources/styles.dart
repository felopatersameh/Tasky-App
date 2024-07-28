import 'package:flutter/material.dart';

import 'colors.dart';

class SizeFontManger {
  static const double s26 = 26.0;
  static const double s24 = 24.0;
  static const double s20 = 20.0;
  static const double s18 = 18.0;
  static const double s16 = 16.0;
  static const double s14 = 14.0;
  static const double s13 = 13.0;
  static const double s12 = 12.0;
}

class WeightFontManger {
  static const FontWeight w400 = FontWeight.w400; // Normal / regular / plain.
  static const FontWeight w500 = FontWeight.w500; //Medium
  static const FontWeight w600 = FontWeight.w600; //Semi-bold.
  static const FontWeight w700 = FontWeight.w700; //Bold
}

class FamilyFontManger {
  static const String defaultFamily = 'Montserrat';
}

TextStyle _getTextStyle(double size, FontWeight weight, Color color) {
  return TextStyle(
      fontSize: size,
      fontFamily: FamilyFontManger.defaultFamily,
      color: color,
      fontWeight: weight,
      overflow: TextOverflow.ellipsis);
}

//--------------------------------------------------------------------- Custom App Bar
TextStyle getBigText() => _getTextStyle(
    SizeFontManger.s24, WeightFontManger.w700, AppColors.colorsText1);
//--------------------------------------------------------------------- Custom Default Text
TextStyle getMediumText() => _getTextStyle(
    SizeFontManger.s14, WeightFontManger.w400, AppColors.colorsText3);
//--------------------------------------------------------------------- Custom other Text
// TextStyle getOtherText() => _getTextStyle(
//         SizeFontManger.s13, WeightFontManger.w400, AppColors.colorPrimaryText)
//     .copyWith(fontFamily: FamilyFontManger.otherFamily);
//--------------------------------------------------------------------- Custom TextFields
TextStyle getTextField() => getMediumText();

//--------------------------------------------------------------------- Custom Text In Buttons

TextStyle getTextButton() => _getTextStyle(
    SizeFontManger.s18, WeightFontManger.w700, AppColors.colorsText2);

TextStyle getSmallText1() => _getTextStyle(
    SizeFontManger.s12, WeightFontManger.w500, AppColors.colorTitleInProfile);

TextStyle getSmallText2() => _getTextStyle(
    SizeFontManger.s18, WeightFontManger.w700, AppColors.colorTextInProfile);

//--------------------------------------------------------------------- Custom
