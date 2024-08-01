import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/Config/Themes/thems.dart';
import 'package:tasky/Features/AddNewTask/domain/repositories/task_repo_impl.dart';
import 'package:tasky/Features/AddNewTask/presentation/manager/new_task_cubit.dart';
import 'package:tasky/Features/Home/domain/repositories/home_repo_impl.dart';
import 'package:tasky/Features/Home/presentation/manager/home_cubit.dart';
import 'package:tasky/Features/Login/domain/repositories/repo_impl_login.dart';
import 'package:tasky/Features/Login/presentation/manager/log_in_cubit.dart';
import 'package:tasky/Features/Profile/domain/repositories/profile_repo_impl.dart';
import 'package:tasky/Features/Profile/presentation/manager/profile_cubit.dart';
import 'package:tasky/Features/TaskDetails/domain/repositories/task_repo_impl.dart';

import 'Config/Route/route_app.dart';
import 'Core/Network/Local/cash_helper.dart';
import 'Core/Network/Remote/dio.dart';
import 'Core/bloc_observer.dart';

import 'Features/SignUp/domain/repositories/repo_impl_sing_up.dart';
import 'Features/SignUp/presentation/manager/sing_up_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LogInCubit(LoginRepoImpl()),
        ),
        BlocProvider(
          create: (context) => SingUpCubit(SingUpRepoImpl()),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(ProfileRepoImpl())..getData(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(HomeRepoImpl())..getListTasks(),
        ),
        BlocProvider(
          create: (context) => NewTaskCubit(AddTaskRepoImpl()),
        ),
      ],
      child: MaterialApp(
        theme: themes,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: GeneratorRoutes.getRoute,
        initialRoute: Routes.routeInSplash,
      ),
    );
  }
}
