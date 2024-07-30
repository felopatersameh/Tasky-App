import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:tasky/Core/Resources/string.dart';import 'package:tasky/Features/Home/data/repositories/home_repo.dart';import '../../../../Config/Route/next_screen.dart';import '../../data/models/task_model.dart';part 'home_state.dart';class HomeCubit extends Cubit<HomeState> {  HomeCubit(this.homeRepo) : super(HomeInitial());  final HomeRepo homeRepo;  static HomeCubit get(context) => BlocProvider.of(context);  Future<void> getListTasks() async {    emit(HomeLoading());    await homeRepo.getAllDataTasks().then((value) {      value.fold((failure) {        if (failure.errMessage == AppStrings.unauthorized) {          emit(Unauthorized());        } else {          emit(HomeFailed(error: failure.errMessage));        }      }, (user) => emit(HomeSuccess(model: user)));    });  }  Future<void> removeTask(context, String id , bool pop ) async {    emit(GetTaskLoading());    await homeRepo.removeTask(id: id).then((value) {      value.fold((failure) => emit(GetTaskFailed(error: failure.errMessage)),          (user) {        pop ? popScreen(context) : null;        emit(GetTaskSuccess(model: user));        HomeCubit.get(context).getListTasks();      });    });  }  Future<void> logout(context) async {    emit(LogoutLoading());    await homeRepo.logout().then((value) {      value.fold((failure) => emit(LogoutFailed(error: failure.errMessage)),          (user) {        emit(LogoutSuccess(model: user));      });    });  }}