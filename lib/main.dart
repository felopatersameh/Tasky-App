import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/Config/Themes/thems.dart';
import 'package:tasky/Features/Login/domain/repositories/repo_impl_login.dart';
import 'package:tasky/Features/Login/presentation/manager/log_in_cubit.dart';

import 'Config/Route/route_app.dart';
import 'Core/Network/Local/cachehelper.dart';
import 'Core/Network/Remote/dio.dart';
import 'Core/bloc_observer.dart';
import 'Features/SignUp/domain/repositories/repo_impl_sing_up.dart';
import 'Features/SignUp/presentation/manager/sing_up_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();
  runApp(const MyApp());
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
      ],
      child: MaterialApp(
        themeAnimationStyle: AnimationStyle.noAnimation,
        theme: themes,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: GeneratorRoutes.getRoute,
        initialRoute: Routes.routeInSplash,
      ),
    );
  }
}
