import 'dart:io';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:tasky/Config/Route/next_screen.dart';import 'package:tasky/Core/Network/Remote/endpoints.dart';import 'package:tasky/Core/Utils/Widget/custom_scaffold_messenger.dart';import 'package:tasky/Features/AddTask/domain/use_cases/add_task_use_case.dart';import 'package:tasky/Features/Home/presentation/manager/home_cubit.dart';import '../../data/models/new_task_model.dart';part 'add_task_state.dart';class AddTaskCubit extends Cubit<NewTaskState> {  AddTaskCubit(this.uploadImageUseCase, this.createTaskUseCase)      : super(NewTaskInitial());  final UploadImageUseCase uploadImageUseCase;  final CreateTaskUseCase createTaskUseCase;  String? _image;  String? priority;  static AddTaskCubit get(context) => BlocProvider.of(context);  Future<void> uploadImage({required File image}) async {    emit(UploadImageLoading());    await uploadImageUseCase.execute(image: image).then((value) {      value          .fold((failure) => emit(UploadImageFailed(error: failure.errMessage)),              (image) {        _image = image;        emit(UploadImageSuccess(model: image));      });    });  }  Future<void> createTask(    context, {    required String title,    required String desc,  }) async {    if (_image == null || priority == null) {      showSnackBar(context, 'Image or priority is null');      return;    }    emit(CreateTaskLoading());    NewTaskModel model = NewTaskModel(      image: '${AppEndPoint.baseUrl}images/$_image',      title: title,      desc: desc,      priority: priority,    );    await createTaskUseCase.execute(model: model).then((value) {      value.fold((failure) => emit(CreateTaskFailed(error: failure.errMessage)),          (value) {        _image = null;        emit(CreateTaskSuccess(model: value));        HomeCubit.get(context).getListTasks();        popScreen(context);      });    });  }}