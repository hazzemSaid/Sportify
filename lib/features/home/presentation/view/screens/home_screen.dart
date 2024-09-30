import 'package:flutter/material.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/widgets/custom_appbar.dart';
import 'package:sportify/features/home/presentation/view/widgets/match_day_card.dart';
import 'package:sportify/features/home/presentation/view/widgets/match_schedules.dart';
import 'package:sportify/features/home/presentation/view/widgets/match_week.dart';
import 'package:sportify/features/home/presentation/view/widgets/title_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C2C2C),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: MatchSchedules(),
            ),
            const SizedBox(height: 20),
            const TitleSection(
              title: 'Match This Week',
              subtitle: 'See All',
            ),
            const SizedBox(height: 8),
            MatchWeek(),
            const SizedBox(height: 20),
            const TitleSection(
              title: 'Match Day',
              subtitle: 'See All',
            ),
            const SizedBox(height: 8),
            const MatchDayCard(
              numberOfCards: 2,
            ),
            const SizedBox(height: 20),
            const TitleSection(
              title: 'Match Highlight',
              subtitle: 'See All',
            ),
          ],
        ),
      ),
    );
  }
}
