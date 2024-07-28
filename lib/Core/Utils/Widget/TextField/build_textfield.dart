import 'package:flutter/material.dart';
import 'package:tasky/Core/Utils/Extensions/padding.dart';

import '../../../Resources/colors.dart';
import '../../../Resources/styles.dart';

class DefaultTextFormField extends StatefulWidget {
  final String text;
  final TextInputType type;
  final IconData? suffix;
  final bool? isPassword;
  final TextEditingController ? controller;
  final Function()? pressSuffix;
  final String? Function(String?)? inputValidator;
  final ValueChanged<String>? submitted;
  final void Function()? onTap ;

  const DefaultTextFormField(
      {super.key,
      required this.text,
      required this.type,
      this.suffix,
       this.inputValidator,
      this.submitted,
      this.isPassword,
      this.pressSuffix,
       this.controller, this.onTap});

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onTap:widget.onTap ,
          style: getTextField(),
          onFieldSubmitted: widget.submitted,
          controller: widget.controller,
          keyboardType: widget.type,
          obscureText: widget.isPassword ?? false,
          validator: widget.inputValidator,
          decoration: InputDecoration(
            labelText: widget.text,
            fillColor: AppColors.colorsControlTextField,
            filled: true,
            suffixIcon: IconButton(
                onPressed: widget.pressSuffix, icon: Icon(widget.suffix)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                const BorderSide(color: AppColors.colorTextFieldBorder)),
          ),
        ),
      ],
    ).paddingAll(15);
  }
}
