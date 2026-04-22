import 'package:travel_app/home_page.dart';
import 'package:travel_app/login_page.dart';
import 'package:travel_app/my_profile.dart';
import 'package:travel_app/signup_page.dart';

class AppRoutes {
  AppRoutes._();

  static const String homepage = '/homepage';
  static const String profile = '/profile';
  static const String login = '/login';
  static const String signup = '/signup';

  static getAppRoutes() => {
    homepage: (context) => const HomePage(),
    profile: (context) => const MyProfile(),
    login: (context) => const LoginPage(),
    signup: (context) => const SignupPage(),
  };
}