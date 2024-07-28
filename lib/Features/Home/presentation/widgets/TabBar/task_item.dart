import 'package:flutter/material.dart';import 'package:tasky/Config/Route/next_screen.dart';import 'package:tasky/Core/Resources/auth.dart';import 'package:tasky/Core/Resources/styles.dart';import 'package:tasky/Core/Utils/Extensions/padding.dart';import 'package:tasky/Core/Utils/Widget/Images/build_image_cash.dart';import 'package:tasky/Features/Home/data/models/TaskModel.dart';import '../../../../../Config/Route/route_app.dart';class TaskItem extends StatefulWidget {  final TaskModel items ;  const TaskItem({    super.key, required this.items,  });  @override  State<TaskItem> createState() => _TaskItemState();}class _TaskItemState extends State<TaskItem> {  void _toggleTapped() {    pushNext(context, Routes.routeTask,arguments: widget.items );  }  Color changeColorTextTitle() {    if (widget.items.status == 'waiting' || widget.items.priority == 'high') {      return const Color(0xffFF7D53);    } else if (widget.items.status == 'Inprogress' || widget.items.priority == 'medium') {      return const Color(0xff5F33E1);    } else {      return const Color(0xff0087FF);    }  }  Color changeColorTextPriority() {    if (widget.items.priority == 'high') {      return const Color(0xffFF7D53);    } else if (widget.items.priority == 'medium') {      return const Color(0xff5F33E1);    } else {      return const Color(0xff0087FF);    }  }  Color changeColorBackGround() {    if (widget.items.status == 'waiting') {      return const Color(0xffFFE4F2);    } else if (widget.items.status == 'Inprogress') {      return const Color(0xffF0ECFF);    } else {      return const Color(0xffE3F2FF);    }  }  @override  Widget build(BuildContext context) {    return GestureDetector(      onTap: _toggleTapped,      child: AnimatedContainer(        duration: const Duration(milliseconds: 300),        curve: Curves.easeInOut,        padding: const EdgeInsets.all(10),        child: ListTile(          leading: BuildImageCash(urlImage: widget.items.image!,),          title: Row(            mainAxisAlignment: MainAxisAlignment.spaceBetween,            children: [              Expanded(                child: Text(                  widget.items.title!,                  maxLines: 1,                  style: getItemTitle(),                ),              ),              Container(                  padding:                      const EdgeInsets.symmetric(vertical: 2, horizontal: 6),                  color: changeColorBackGround(),                  child: Text(                    widget.items.status!,                    style:                        getSmallText1().copyWith(color: changeColorTextTitle()),                  )),            ],          ).paddingSH(15),          subtitle: Column(            crossAxisAlignment: CrossAxisAlignment.start,            children: [              Text(                widget.items.desc!,                style: getItemDesc(),              ),              Row(                mainAxisAlignment: MainAxisAlignment.spaceBetween,                children: [                  Row(                    children: [                      Icon(                        Icons.outlined_flag_outlined,                        color: changeColorTextPriority(),                      ),                      Text(widget.items.priority!,                          style: getItemPriority()                              .copyWith(color: changeColorTextPriority())),                    ],                  ),                  Text(                    formatDate2(widget.items.createdAt!),                    style: getItemDue(),                  ),                ],              ),            ],          ).paddingSH(15),          trailing: const Icon(Icons.more_vert_outlined),        ),      ),    );  }}