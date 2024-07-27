import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:tasky/Core/Resources/colors.dart';
import 'package:tasky/Core/Utils/Extensions/padding.dart';

import '../../Resources/styles.dart';

class DefaultButton extends StatelessWidget {
  final void Function() press;
  final String text;
  final double? width;
  final Color? background;
  final EdgeInsetsGeometry? padding;
  final bool condition;

  const DefaultButton(
      {super.key,
      this.background,
      required this.press,
      required this.text,
      this.width,
      this.padding,
      required this.condition});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
        condition: condition,
        fallback: (context) => const Center(child: CircularProgressIndicator()),
        builder: (context) {
          return Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                color: background ?? AppColors.colorsButtonsPri,
                borderRadius: BorderRadius.circular(25)),
            width: width,
            child: MaterialButton(
              padding: padding,
              onPressed: press,
              child: Text(text,
                  style: background == null
                      ? getTextButton()
                      : getTextButton().copyWith(color: Colors.black)),
            ),
          ).paddingAll(20);
        });
  }
}
