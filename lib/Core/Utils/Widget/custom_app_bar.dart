import 'package:flutter/material.dart';import 'package:tasky/Core/Utils/Extensions/padding.dart';AppBar buildCustomAppBar({  required String title,}) {  return AppBar(    title: Text(      title,    ).paddingAll(10),  );}