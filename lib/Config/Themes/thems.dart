import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Core/Resources/colors.dart';


ThemeData themes = ThemeData(
  scaffoldBackgroundColor: AppColors.colorsBackGround,
  appBarTheme: const AppBarTheme(
    // titleTextStyle: getTextCustomAppBar(),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.colorBackgroundLight,
        statusBarIconBrightness: Brightness.light),
    iconTheme: IconThemeData(
      color: AppColors.colorIcon,
      size: 30,
    ),
    backgroundColor: AppColors.colorBackgroundAppBar,
  //   elevation: 0.0,
  //   // titleTextStyle: getTitleTextAppBar(Colors.black)
  // ),
  ));
