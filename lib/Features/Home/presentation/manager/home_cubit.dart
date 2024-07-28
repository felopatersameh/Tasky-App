import 'package:bloc/bloc.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:meta/meta.dart';import 'package:tasky/Features/Home/data/repositories/home_repo.dart';import '../../data/models/TaskModel.dart';part 'home_state.dart';class HomeCubit extends Cubit<HomeState> {  HomeCubit(this.homeRepo) : super(HomeInitial());  final HomeRepo homeRepo;  static HomeCubit get(context) => BlocProvider.of(context);  Future<void> getListTasks() async {    emit(HomeLoading());    await homeRepo.getAllDataTasks().then((value) {      value.fold((failure) => emit(HomeFailed(error: failure.errMessage)),          (user) => emit(HomeSuccess(model: user)));    });  }}