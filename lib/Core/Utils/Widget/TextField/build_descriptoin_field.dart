import 'package:flutter/material.dart';
import 'package:tasky/Core/Utils/Extensions/padding.dart';

import '../../../Resources/colors.dart';
import '../../../Resources/styles.dart';
//Description
class DefaultDescriptionFormField extends StatefulWidget {
  final String text;
  final String hint;
  final TextInputType type;
  final IconData? suffix;
  final bool? isPassword;
  final TextEditingController controller;
  final Function()? pressSuffix;
  final String? Function(String?) inputValidator;
  final ValueChanged<String>? submitted;

  const DefaultDescriptionFormField(
      {super.key,
      required this.text,
      required this.type,
      this.suffix,
      required this.inputValidator,
      this.submitted,
      this.isPassword,
      this.pressSuffix,
      required this.hint,
      required this.controller});

  @override
  State<DefaultDescriptionFormField> createState() => _DefaultDescriptionFormFieldState();
}

class _DefaultDescriptionFormFieldState extends State<DefaultDescriptionFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: getMediumText(),
        ),
        TextFormField(
          style: getTextField(),
          onFieldSubmitted: widget.submitted,
          controller: widget.controller,
          keyboardType: widget.type,
          obscureText: widget.isPassword ?? false,
          validator: widget.inputValidator,
          decoration: InputDecoration(
            fillColor: AppColors.colorsControlTextField,
            filled: true,
            hintText: widget.hint,
            suffixIcon: IconButton(
                onPressed: widget.pressSuffix, icon: Icon(widget.suffix)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    const BorderSide(color: AppColors.colorTextFieldBorder)
            ),
          ),
        ),
      ],
    ).paddingAll(15);
  }
}
