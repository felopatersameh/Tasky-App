import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:tasky/Core/Resources/string.dart';import 'package:tasky/Core/Utils/Extensions/padding.dart';import 'package:tasky/Core/Utils/Widget/custom_app_bar.dart';import 'package:tasky/Core/Utils/Widget/custom_loading.dart';import 'package:tasky/Core/Utils/Widget/custom_massage.dart';import 'package:tasky/Features/Profile/presentation/manager/user_cubit.dart';import '../widgets/build_user_fields.dart';class ProfileScreen extends StatefulWidget {  const ProfileScreen({super.key});  @override  State<ProfileScreen> createState() => _ProfileScreenState();}class _ProfileScreenState extends State<ProfileScreen>    with SingleTickerProviderStateMixin {  late AnimationController _controller;  late Animation<double> _fadeAnimation;  late Animation<Offset> _slideAnimation;  @override  void initState() {    super.initState();    UserCubit.get(context).getData();    _controller = AnimationController(      duration: const Duration(milliseconds: 500),      vsync: this,    );    _fadeAnimation = CurvedAnimation(      parent: _controller,      curve: Curves.easeIn,    );    _slideAnimation = Tween<Offset>(      begin: const Offset(0.0, 0.1),      end: Offset.zero,    ).animate(CurvedAnimation(      parent: _controller,      curve: Curves.easeOut,    ));    _controller.forward();  }  @override  void dispose() {    _controller.dispose();    super.dispose();  }  @override  Widget build(BuildContext context) {    return BlocBuilder<UserCubit, UserState>(      builder: (context, state) {        if (state is ProfileSuccess) {          return Scaffold(            appBar: buildCustomAppBar(title: AppStrings.profile),            body: FadeTransition(              opacity: _fadeAnimation,              child: SlideTransition(                position: _slideAnimation,                child: Column(                  crossAxisAlignment: CrossAxisAlignment.start,                  children: [                    ProfileField(                        label: AppStrings.name.toUpperCase(),                        value: state.model.displayName!),                    ProfileField(                        label: AppStrings.phone.toUpperCase(),                        value: state.model.username!,                        isPhone: true),                    ProfileField(                        label: AppStrings.level.toUpperCase(),                        value: state.model.level!),                    ProfileField(                        label: AppStrings.experienceYears.toUpperCase(),                        value: '${state.model.experienceYears!} years'),                    ProfileField(                        label: AppStrings.location,                        value: state.model.address!),                  ],                ).paddingAll(16),              ),            ),          );        } else if (state is ProfileFailed) {          return CustomMassage(massage: state.error);        } else {          return const CustomLoading();        }      },    );  }}