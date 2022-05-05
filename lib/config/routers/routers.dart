import 'package:chatmate/modules/dashboard/dashboard.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'package:chatmate/modules/login/login.dart';
import 'package:chatmate/modules/signup/signup.dart';

class GetRouter{
  List<GetPage<dynamic>> getRoutes = [
    GetPage(name: '/', page: () =>  LoginScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/dashboard', page: () => DashboardScreen()),
    GetPage(name: '/signup', page: () =>  SignupScreen()),
  ];
}