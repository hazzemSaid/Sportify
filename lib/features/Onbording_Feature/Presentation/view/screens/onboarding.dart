import 'package:flutter/material.dart';
import 'package:get/get.dart'; // تأكد من استيراد get
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sportify/features/Onbording_Feature/Presentation/view/widgets/custom_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          OnboardingScreen(
            image: 'assets/images/onboarding1.png',
            title: 'Easy Streaming',
            subtitle:
                "Choose your plan to watch live match your favourite club.",
            onPressed: () => _navigateToNextPage(),
            pageController: _pageController,
            pageCount: 3,
            buttonText: 'Next',
            secondaryButtonText: 'Skip',
            onTap: () {
              Get.toNamed('/loginScreen');
            },
          ),
          OnboardingScreen(
            image: 'assets/images/onboarding2.png',
            title: 'Always Uptodate',
            subtitle: 'Stay updated with match highlight, preview and hot news',
            onPressed: () => _navigateToNextPage(),
            pageController: _pageController,
            pageCount: 3,
            buttonText: 'Next',
            secondaryButtonText: 'Back',
            onTap: () {
              _navigateToPreviousPage();
            },
          ),
          OnboardingScreen(
            image: 'assets/images/onboarding3.png',
            title: 'Get Amazing Reward',
            subtitle: "Redeem your points to get an amazing reward",
            onPressed: () => _completeOnboarding(),
            pageController: _pageController,
            pageCount: 3,
            buttonText: 'Get Started',
            secondaryButtonText: 'Back',
            onTap: () {
              _navigateToPreviousPage();
            },
          ),
        ],
      ),
    );
  }

  void _navigateToNextPage() {
    if (_pageController.page != null) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _navigateToPreviousPage() {
    if (_pageController.page != null && _pageController.page! > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _completeOnboarding() {
    Navigator.pushReplacementNamed(context, '/registerScreen');
  }
}

class OnboardingScreen extends StatelessWidget {
  final VoidCallback onPressed;
  final String image;
  final String title;
  final String subtitle;
  final PageController pageController;
  final int pageCount;
  final String buttonText;
  final String secondaryButtonText;
  final VoidCallback onTap;

  const OnboardingScreen({
    super.key,
    required this.onPressed,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.pageController,
    required this.pageCount,
    required this.buttonText,
    required this.secondaryButtonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen height
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0xff1E1E1E),
            Color(0xFF2E2E2E),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: screenHeight * 0.5,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: pageCount,
            effect: const WormEffect(
              activeDotColor: Colors.white,
              dotHeight: 8,
              dotWidth: 8,
              spacing: 5.0,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          CustomButton(
            text: buttonText,
            onPressed: onPressed,
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: onTap,
            child: Text(
              secondaryButtonText,
              style: const TextStyle(
                color: Color(0xff8D8D8D),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}
