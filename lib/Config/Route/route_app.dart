import 'package:flutter/material.dart';
import 'package:tasky/Features/Login/presentation/pages/login_screen.dart';
import 'package:tasky/Features/Start/start_screen.dart';

import '../../Features/Home/presentation/pages/home_screen.dart';
import '../../Features/Profile/presentation/pages/profile_screen.dart';
import '../../Features/SignUp/presentation/pages/sing_up_screen.dart';
import '../../Features/Splash/splash_screen.dart';

class Routes {
  static const String routeInSplash = '/';
  static const String routeInStart = '/Start';
  static const String routeLogin = '/login';
  static const String routeCreateAccount = '/createAccount';
  static const String routeTask = '/Task';
  static const String routeHome = '/Home';
  static const String routeAddNew = '/AddNew';
  static const String routeProfile = '/Profile';
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
      // case (Routes.routeLayout):
      //   return MaterialPageRoute(builder: (_) => const LayoutScreen());
      // case (Routes.routeHome):
      //   return MaterialPageRoute(builder: (_) => const HomeScreen());
      case (Routes.routeHome):
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      // case (Routes.routeFavorite):
      //   return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      case (Routes.routeProfile):
        return MaterialPageRoute(builder: (_) =>  const ProfileScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
