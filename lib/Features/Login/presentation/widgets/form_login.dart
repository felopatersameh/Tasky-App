import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:tasky/Config/Route/next_screen.dart';import 'package:tasky/Config/Route/route_app.dart';import 'package:tasky/Features/Home/presentation/manager/home_cubit.dart';import 'package:tasky/Features/Login/presentation/manager/log_in_cubit.dart';import '../../../../Core/Resources/validate.dart';import '../../../../Core/Resources/string.dart';import '../../../../Core/Utils/Widget/TextField/build_text_field.dart';import '../../../../Core/Utils/Widget/TextField/phone_field.dart';import '../../../../Core/Utils/Widget/build_bottom_authentication.dart';import '../../../../Core/Utils/Widget/build_button.dart';import '../../../../Core/Utils/Widget/custom_scaffold_messenger.dart';TextEditingController phoneController = TextEditingController();TextEditingController passwordController = TextEditingController();class FormLogin extends StatefulWidget {  const FormLogin({super.key});  @override  State<FormLogin> createState() => _FormLoginState();}class _FormLoginState extends State<FormLogin> {  final key = GlobalKey<FormState>();  @override  Widget build(BuildContext context) {    return BlocConsumer<LogInCubit, LogInState>(      listener: (context, state) {        if (state is LoginSuccess) {          showSnackBar(context, AppStrings.successMessage);          pushReplacement(context, Routes.routeHome);          HomeCubit.get(context).getListTasks();        } else if (state is LoginFailed) {          showSnackBar(context, state.error);        }      },      builder: (context, state) {        return Form(            key: key,            child: Column(              children: [                CustomInternationalPhoneNumberInput(                  controller: phoneController,                ),                DefaultTextFormField(                  pressSuffix: () =>                      LogInCubit.get(context).changeShowPassword(),                  suffix: LogInCubit.get(context).iconSuffix,                  text: AppStrings.password,                  isPassword: LogInCubit.get(context).isShowPassword,                  type: TextInputType.visiblePassword,                  inputValidator: (value) => validatePassword(                    false,                    password: value.toString(),                  ),                  controller: passwordController,                ),                DefaultButton(                  width: MediaQuery.of(context).size.width * .8,                  press: () => validateLogIn(context,                      key: key,                      password: passwordController.text,                      phone: phoneController.text),                  text: AppStrings.singIN,                  condition: true,                ),                const BuildBottomAuthentication(                  isLogIn: true,                )              ],            ));      },    );  }}