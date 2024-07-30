import 'package:flutter/material.dart';import 'package:intl/intl.dart';import 'package:tasky/Core/Resources/string.dart';import 'package:tasky/Core/Resources/validate.dart';import 'package:tasky/Core/Utils/Extensions/padding.dart';import '../../../../Core/Resources/colors.dart';import '../../../../Core/Resources/styles.dart';class DatePickerTextField extends StatefulWidget {  const DatePickerTextField({super.key, });  @override  State<DatePickerTextField> createState() => _DatePickerTextFieldState();}class _DatePickerTextFieldState extends State<DatePickerTextField> {  final TextEditingController _dateController = TextEditingController();  Future<void> _selectDate(BuildContext context) async {    DateTime? pickedDate = await showDatePicker(      context: context,      initialDate: DateTime.now(),      firstDate: DateTime(2000),      lastDate: DateTime(2101),    );    if (pickedDate != null) {      setState(() {        _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);      });    }  }  @override  Widget build(BuildContext context) {    return TextFormField(      validator:  (p0) =>defaultValidate(text: p0.toString(), validate: AppStrings.otherValidate),      controller: _dateController,      style: getTextField(),      decoration: InputDecoration(        hintStyle: getTextField(),        hintText: 'choose due date...',        fillColor: AppColors.colorsControlTextField,        filled: true,        suffixIcon: const Icon(          Icons.calendar_month_rounded,          color: AppColors.colorPrimary,        ),        border: OutlineInputBorder(            borderRadius: BorderRadius.circular(15),            borderSide:                const BorderSide(color: AppColors.colorTextFieldBorder)),      ),      readOnly: true,      onTap: () => _selectDate(context),    ).paddingAll(15);  }}