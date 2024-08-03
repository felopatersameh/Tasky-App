import 'package:flutter/material.dart';import 'package:tasky/Core/Utils/Extensions/padding.dart';import 'package:tasky/Core/Utils/Extensions/size_box.dart';import 'package:tasky/Features/Home/data/models/task_model.dart';import 'package:tasky/Features/Home/presentation/manager/home_cubit.dart';import '../../../../Core/Resources/list.dart';import '../../../../Core/Resources/string.dart';import '../../../../Core/Resources/styles.dart';import '../../../../Core/Resources/validate.dart';import '../../../../Core/Utils/Widget/TextField/build_text_field.dart';import '../../../AddTask/presentation/widgets/image_picker.dart';import '../../../TaskDetails/presentation/widgets/drop_down_button_form_field.dart';class FormEdit extends StatefulWidget {  final TaskModel item;  const FormEdit({super.key, required this.item});  @override  State<FormEdit> createState() => _FormEditState();}class _FormEditState extends State<FormEdit> {  final key = GlobalKey<FormState>();  late TextEditingController controllerDescription;  late TextEditingController controllerTitle;  late String priority;  late String status;  late String imageTask;  @override  void initState() {    controllerDescription = TextEditingController(text: widget.item.desc);    controllerTitle = TextEditingController(text: widget.item.title);    priority = widget.item.priority!;    imageTask = widget.item.image!;    status = widget.item.status!;    HomeCubit.get(context).controllerTitle = controllerTitle.text;    HomeCubit.get(context).controllerDescription = controllerDescription.text;    HomeCubit.get(context).status = status;    HomeCubit.get(context).priority = priority;    super.initState();  }  @override  Widget build(BuildContext context) {    return Form(      onChanged: () {        HomeCubit.get(context).controllerTitle = controllerTitle.text;        HomeCubit.get(context).controllerDescription =            controllerDescription.text;      },      key: key,      child: Column(        crossAxisAlignment: CrossAxisAlignment.start,        children: [          20.sH,          ImagePickerWidget(            imageTask: imageTask,          ),          Text(            AppStrings.title,            style: getSmallText2(),          ).paddingSH(15),          DefaultTextFormField(            inputValidator: (p0) => defaultValidate(                text: p0.toString(), validate: AppStrings.otherValidate),            controller: controllerTitle,            text: AppStrings.hintTitle,            type: TextInputType.text,          ),          Text(            AppStrings.description,            style: getSmallText2(),          ).paddingSH(15),          DefaultTextFormField(            inputValidator: (p0) => defaultValidate(                text: p0.toString(), validate: AppStrings.otherValidate),            controller: controllerDescription,            text: AppStrings.hintDescription,            type: TextInputType.text,            maxLine: 8,          ),          Text(            AppStrings.priority,            style: getSmallText2(),          ).paddingSH(15),          DropdownButtonFormFieldTasks(            status: priority,            items: AppList.itemsPriority(),            onChanged: (p0) => HomeCubit.get(context).priority = p0,          ).paddingSH(15),          Text(            AppStrings.status,            style: getSmallText2(),          ).paddingSH(15),          DropdownButtonFormFieldTasks(            status: status,            items: AppList.itemsStatus(),            onChanged: (p0) => HomeCubit.get(context).status = p0,          ).paddingSH(15),          16.sH,        ],      ),    );  }}