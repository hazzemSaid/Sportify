import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportify/features/Home/presentation/view/screens/home_screen.dart';
import 'package:sportify/features/MatchTabelDay/presentation/view/screens/match_table_screen.dart';
import 'package:sportify/features/Profile/presentation/view/screens/profile_screen.dart';
import 'package:sportify/features/home/presentation/view/screens/explore_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => Theme(
          data: ThemeData(
            navigationBarTheme: NavigationBarThemeData(
              backgroundColor: const Color(0xff2C2C2C),
              indicatorColor: Colors.transparent,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                (states) {
                  if (states.contains(WidgetState.selected)) {
                    return const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    );
                  } else {
                    return const TextStyle(
                      color: Colors.grey,
                    );
                  }
                },
              ),
            ),
          ),
          child: NavigationBar(
            height: 60,
            selectedIndex: controller.selectedIndex.value,
            elevation: 0,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined, color: Colors.grey),
                selectedIcon: Icon(Icons.home, color: Colors.white),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.video_collection_outlined, color: Colors.grey),
                selectedIcon: Icon(Icons.video_collection, color: Colors.white),
                label: 'Explore',
              ),
              NavigationDestination(
                icon: Icon(Icons.sports_soccer_outlined, color: Colors.grey),
                selectedIcon:
                    Icon(Icons.sports_soccer_outlined, color: Colors.white),
                label: 'Matchs',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_2_outlined, color: Colors.grey),
                selectedIcon: Icon(Icons.person_2, color: Colors.white),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const ExploreScreen(),
    MatchTableScreen(),
    const ProfileScreen(),
  ];
}
