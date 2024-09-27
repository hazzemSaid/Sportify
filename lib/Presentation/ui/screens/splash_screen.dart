import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sportify/Presentation/ui/screens/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterSplashScreen.gif(
          useImmersiveMode: true,
          gifPath: 'assets/images/Sportify.gif',
          gifWidth: 269,
          gifHeight: 474,
          nextScreen: const OnboardingPage(),
          duration: const Duration(milliseconds: 2800),
        ),
      ),
    );
  }
}
