import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import '../../data/remote/models/login_model.dart';import '../../data/repositories/repo_login.dart';part 'log_in_state.dart';class LogInCubit extends Cubit<LogInState> {  LogInCubit(this.homeRepo) : super(LogInInitial());  static LogInCubit get(context) => BlocProvider.of(context);  final LoginRepo homeRepo;  bool isShowPassword = true;  IconData iconSuffix = Icons.visibility_rounded;  void changeShowPassword() {    isShowPassword = !isShowPassword;    isShowPassword == true        ? iconSuffix = Icons.visibility_rounded        : iconSuffix = Icons.visibility_off_rounded;    emit(LoginChangesShowPassword());  }  Future<void> login({    required String phone,    required String password,  }) async {    emit(LoginLoading());    await homeRepo.fetchLogin(phone: phone, password: password).then((value) {      value.fold((failure) => emit(LoginFailed(error: failure.errMessage)),          (user) => emit(LoginSuccess(model: user)));    });  }}