import 'package:flutter/material.dart';
import 'package:tasky/Features/Edit/presentation/pages/edit_screen.dart';
import 'package:tasky/Features/Home/data/models/task_model.dart';
import 'package:tasky/Features/Login/presentation/pages/login_screen.dart';
import 'package:tasky/Features/Start/start_screen.dart';

import '../../Features/AddNewTask/presentation/pages/new_task_screen.dart';
import '../../Features/Home/presentation/pages/home_screen.dart';
import '../../Features/Profile/presentation/pages/profile_screen.dart';
import '../../Features/QR/presentation/pages/camera_qr.dart';
import '../../Features/SignUp/presentation/pages/sing_up_screen.dart';
import '../../Features/Splash/splash_screen.dart';
import '../../Features/TaskDetails/presentation/pages/tass_details_screen.dart';

class Routes {
  static const String routeInSplash = '/';
  static const String routeInStart = '/Start';
  static const String routeLogin = '/login';
  static const String routeCreateAccount = '/createAccount';
  static const String routeTask = '/Task';
  static const String routeHome = '/Home';
  static const String routeAddNew = '/AddNew';
  static const String routeProfile = '/Profile';
  static const String routeEdit = '/Edit';
  static const String routeQr = '/Qr';
}

class GeneratorRoutes {
  static Route<dynamic> getRoute(RouteSettings setting) {
    switch (setting.name) {
      case (Routes.routeInSplash):
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case (Routes.routeInStart):
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case (Routes.routeLogin):
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case (Routes.routeCreateAccount):
        return MaterialPageRoute(builder: (_) => const SingUpScreen());
      case (Routes.routeTask):
        return MaterialPageRoute(
            builder: (_) => TaskDetailsScreen(
                  item: setting.arguments as TaskModel,
                ));
      case (Routes.routeHome):
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case (Routes.routeProfile):
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case (Routes.routeAddNew):
        return MaterialPageRoute(builder: (_) => const NewTaskScreen());
      case (Routes.routeEdit):
        return MaterialPageRoute(
            builder: (_) => EditScreen(
                  item: setting.arguments as TaskModel,
                ));
      case (Routes.routeQr):
        return MaterialPageRoute(builder: (_) => const QRViewExample());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
