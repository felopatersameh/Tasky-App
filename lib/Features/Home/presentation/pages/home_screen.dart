import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:tasky/Core/Resources/string.dart';import 'package:tasky/Core/Resources/styles.dart';import 'package:tasky/Core/Utils/Extensions/padding.dart';import 'package:tasky/Features/Home/presentation/manager/home_cubit.dart';import 'package:tasky/Features/Home/presentation/widgets/custom_floating.dart';import '../../../../Config/Route/next_screen.dart';import '../../../../Config/Route/route_app.dart';import '../../../../Core/Utils/Widget/custom_loading.dart';import '../../../../Core/Utils/Widget/custom_massage.dart';import '../widgets/TabBar/build_button_tab_bar.dart';import '../widgets/custom_app_bar_home.dart';import '../widgets/TabBar/tab_bar.dart';class HomeScreen extends StatelessWidget {  const HomeScreen({super.key});  @override  Widget build(BuildContext context) {    return BlocConsumer<HomeCubit, HomeState>(      listener: (context, state) {        if (state is LogoutSuccess)          {            pushNextAndRemove(context, Routes.routeLogin);          }      },      builder: (context, state) {        if (state is HomeSuccess) {          return _BuildBodyHome(state: state);        } else if (state is HomeFailed) {          return CustomMassage(            massage: state.error,          );        } else {          return const CustomLoading();        }      },    );  }}class _BuildBodyHome extends StatelessWidget {  final HomeSuccess state;  const _BuildBodyHome({    required this.state,  });  @override  Widget build(BuildContext context) {    return Scaffold(      appBar: buildAppBarTasks(context),      body: DefaultTabController(        length: 4,        child: Column(          children: [            Align(                alignment: Alignment.centerLeft,                child: Text(                  AppStrings.titleList,                  style: getMediumText()                      .copyWith(fontWeight: FontWeight.w700, fontSize: 18),                ).paddingSH(30)),            const BuildButtonsTabBar(),            ViewItemsTabBar(              list: state.model,            ),          ],        ),      ),      floatingActionButton: customFloatingActionButton(),      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,    );  }}