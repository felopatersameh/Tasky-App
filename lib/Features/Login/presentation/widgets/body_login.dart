import 'package:flutter/material.dart';import 'package:tasky/Core/Utils/Extensions/padding.dart';import 'package:tasky/Core/Resources/string.dart';import 'package:tasky/Core/Resources/styles.dart';import 'package:tasky/Features/SignUp/presentation/widgets/form_sing_up.dart';import 'form_login.dart';class BuildBodyLogin extends StatelessWidget {  const BuildBodyLogin({super.key});  @override  Widget build(BuildContext context) {    return Column(          crossAxisAlignment: CrossAxisAlignment.start,          children: [            Text(              AppStrings.login,              style: getBigText(),            ).paddingAll(15),            const FormLogin()          ],        );  }}