import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:tasky/Core/Utils/Widget/custom_app_bar.dart';import 'package:tasky/Features/AddNewTask/presentation/manager/new_task_cubit.dart';import '../widgets/form_add_new.dart';class NewTaskScreen extends StatelessWidget {  const NewTaskScreen({super.key});  @override  Widget build(BuildContext context) {    return BlocBuilder<NewTaskCubit, NewTaskState>(      builder: (context, state) {        return Scaffold(          appBar: buildCustomAppBar(title: 'New Task'),          body: const SafeArea(            child: SingleChildScrollView(child: FormAddTask()),          ),        );      },    );  }}