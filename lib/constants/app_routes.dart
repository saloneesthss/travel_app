import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/auth/login_page.dart';
import 'package:travel_app/screens/my_profile.dart';
import 'package:travel_app/auth/signup_page.dart';
import 'package:travel_app/screens/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String homepage = '/homepage';
  static const String profile = '/profile';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String splash = '/';

  static getAppRoutes() => {
    homepage: (context) => const HomeScreen(),
    profile: (context) => const ProfileScreen(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignupScreen(),
    splash: (context) => const SplashScreen(),
  };
}