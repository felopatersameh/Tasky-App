import 'package:flutter/material.dart';import '../manager/task_cubit.dart';class BuildPopupMenuButton extends StatelessWidget {  final String id;  const BuildPopupMenuButton({    super.key,    required this.id,  });  @override  Widget build(BuildContext context) {    return PopupMenuButton(      shape: OutlineInputBorder(          borderRadius: BorderRadius.circular(20),          borderSide: const BorderSide(width: 0, color: Colors.transparent)),      icon: const Icon(Icons.more_vert),      offset: const Offset(50, 50),      itemBuilder: (BuildContext context) => [        const PopupMenuItem(          value: 'Edit',          child: const Text('Edit'),        ),        PopupMenuItem(          value: 'Delete',          onTap: () => TaskCubit.get(context).removeTask(context, id),          child: const Text(            'Delete',            style: TextStyle(color: Colors.red),          ),        ),      ],    );  }}