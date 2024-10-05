import 'package:flutter/material.dart';
import 'package:sportify/features/Home/presentation/view/screens/home_screen.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/screens/login_screen.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/screens/register_screen.dart';
import 'package:sportify/features/Onbording_Feature/Presentation/view/screens/onboarding.dart';
import 'package:sportify/features/Onbording_Feature/Presentation/view/screens/splash_screen.dart';
import 'package:sportify/features/Home/presentation/view/widgets/bottom_nav_bar.dart';
import 'package:sportify/features/home/presentation/view/screens/fav_football_team.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onBoarding = '/onBoarding';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String homeScreen = '/homeScreen';
  static const String bottomNavBar = '/bottomNavBar';
  static const String favfootballteam = '/favfootballteam';

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
      case bottomNavBar:
        return MaterialPageRoute(builder: (_) => const BottomNavBar());
      case favfootballteam:
        return MaterialPageRoute(builder: (_) => const FavFootballTeam());
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
