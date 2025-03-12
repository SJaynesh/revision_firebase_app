import 'package:get/get.dart';
import 'package:revision_firebase_app/views/screens/auth/login_page.dart';
import 'package:revision_firebase_app/views/screens/auth/register_page.dart';
import 'package:revision_firebase_app/views/screens/home/home_page.dart';
import 'package:revision_firebase_app/views/screens/splash.dart';

class Routes {
  static String splash = '/';
  static String login = '/login';
  static String register = '/register';
  static String home = '/home';

  static List<GetPage> getPage = [
    GetPage(name: splash, page: () => Splash(),),
    GetPage(name: login, page: () => LoginPage(),),
    GetPage(name: register, page: () => RegisterPage(),),
    GetPage(name: home, page: () => HomePage(),),
  ];
}