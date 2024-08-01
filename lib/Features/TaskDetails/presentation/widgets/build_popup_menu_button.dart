import 'package:flutter/material.dart';import 'package:tasky/Config/Route/next_screen.dart';import 'package:tasky/Config/Route/route_app.dart';import 'package:tasky/Core/Resources/icons.dart';import 'package:tasky/Core/Resources/string.dart';import 'package:tasky/Features/Home/data/models/task_model.dart';import 'package:tasky/Features/Home/presentation/manager/home_cubit.dart';class BuildPopupMenuButton extends StatelessWidget {  final TaskModel items;  const BuildPopupMenuButton({    super.key,    required this.items,  });  @override  Widget build(BuildContext context) {    return PopupMenuButton(      shape: OutlineInputBorder(          borderRadius: BorderRadius.circular(20),          borderSide: const BorderSide(width: 0, color: Colors.transparent)),      icon: AppIcons.moreVert,      offset: const Offset(50, 50),      itemBuilder: (BuildContext context) => [        PopupMenuItem(          onTap: () => pushNext(context, Routes.routeEdit,arguments: items),          value: AppStrings.edite,          child: const Text(AppStrings.edite),        ),        PopupMenuItem(          value: AppStrings.delete,          onTap: () =>              HomeCubit.get(context).removeTask(context, items.id!),          child: const Text(            AppStrings.delete,            style: TextStyle(color: Colors.red),          ),        ),      ],    );  }}