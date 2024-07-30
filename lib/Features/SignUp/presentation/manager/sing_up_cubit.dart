import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:tasky/Features/SignUp/data/repositories/repo_sing_up.dart';import '../../data/models/sing_up_model.dart';part 'sing_up_state.dart';class SingUpCubit extends Cubit<SingUpState> {  SingUpCubit(this.homeRepo) : super(SingUpInitial());  static SingUpCubit get(context) => BlocProvider.of(context);  final SingUpRepo homeRepo;  bool isShowPassword = true;  IconData iconSuffix = Icons.visibility_rounded;  void changeShowPassword() {    isShowPassword = !isShowPassword;    isShowPassword == true        ? iconSuffix = Icons.visibility_rounded        : iconSuffix = Icons.visibility_off_rounded;    emit(SingUpChangesShowPassword());  }  String? selectedValue;  void changeValue(String value) {    selectedValue = value;    emit(ChangeValue());  }  Future<void> singUp({    required String name,    required num experienceYears,    required String address,    required String level,    required String phone,    required String password,  }) async {    emit(SingUpLoading());    await homeRepo        .fetchRegister(            address: address,            experienceYears: experienceYears,            level: level,            name: name,            phone: phone,            password: password)        .then((value) {      value.fold((failure) => emit(SingUpFailed(error: failure.errMessage)),          (user) => emit(SingUpSuccess(model: user)));    });  }}