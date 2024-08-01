import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:tasky/Config/Route/next_screen.dart';import 'package:tasky/Features/Home/data/models/task_model.dart';import 'package:tasky/Features/Home/presentation/manager/home_cubit.dart';import '../widgets/body_task_details.dart';import '../widgets/custom_app_bar_task.dart';class TaskDetailsScreen extends StatefulWidget {  final TaskModel item;  const TaskDetailsScreen({super.key, required this.item});  @override  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();}late DateTime dateTime;late bool hasPassed;class _TaskDetailsScreenState extends State<TaskDetailsScreen> {  @override  void initState() {    //!removed    DateTime now = DateTime.now();    dateTime = DateTime.parse(widget.item.createdAt!);    hasPassed = dateTime.isAfter(now);    super.initState();  }  @override  Widget build(BuildContext context) {    return BlocConsumer<HomeCubit, HomeState>(      listener: (context, state) {        if (state is RemoveTaskSuccess) {          HomeCubit.get(context).getListTasks();          popScreen(context);        }      },      builder: (context, state) {        return _buildScaffold();      },    );  }  Scaffold _buildScaffold() => Scaffold(        appBar: customAppBarTask(widget.item),        body: BodyTaskDetails(widget: widget),      );}