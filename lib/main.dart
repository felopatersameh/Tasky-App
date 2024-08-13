import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/Config/Themes/thems.dart';
import 'package:tasky/Core/Network/service_locator.dart';
import 'package:tasky/Features/Home/domain/use_cases/home_use_case.dart';
import 'package:tasky/Features/Home/presentation/manager/home_cubit.dart';
import 'package:tasky/Features/User/domain/use_cases/user_use_case.dart';
import 'package:tasky/Features/User/presentation/manager/user_cubit.dart';
import 'Config/Route/route_app.dart';
import 'Core/Network/Local/cash_helper.dart';
import 'Core/Network/Remote/dio.dart';

import 'Features/Authentication/Login/presentation/manager/log_in_cubit.dart';
import 'Features/Authentication/SignUp/presentation/manager/sing_up_cubit.dart';
import 'Features/Authentication/domain/use_cases/authentication_use_cases.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupService();
  DioHelper.init();
  await CashHelper.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((context) {
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
          create: (context) => LogInCubit(getIt<LoginUseCase>()),
        ),
        BlocProvider(
          create: (context) => SingUpCubit(getIt<SignUpUseCase>()),
        ),
        BlocProvider(
          create: (context) => UserCubit(getIt<UserUseCase>()),
        ),
        BlocProvider(
            create: (context) => HomeCubit(
                getIt<GetAllTasksUseCase>(),
                getIt<LogoutUseCase>(),
                getIt<RemoveTaskUseCase>(),
                getIt<RefreshTokenUseCase>(),
                getIt<EditTaskUseCase>())),
      ],
      child: MaterialApp(
        theme: themes,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.routeInSplash,
        onGenerateRoute: GeneratorRoutes.getRoute,
      ),
    );
  }
}
