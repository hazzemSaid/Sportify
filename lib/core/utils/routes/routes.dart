import 'package:flutter/material.dart';
import 'package:sportify/features/home/presentation/view/screens/home_screen.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/screens/login_screen.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/screens/register_screen.dart';
import 'package:sportify/features/Onbording_Feature/Presentation/view/screens/onboarding.dart';
import 'package:sportify/features/Onbording_Feature/Presentation/view/screens/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onBoarding = '/onBoarding';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String homeScreen = '/homeScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
