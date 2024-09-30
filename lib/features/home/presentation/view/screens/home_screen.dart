import 'package:flutter/material.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/widgets/custom_appbar.dart';
import 'package:sportify/features/home/presentation/view/widgets/league_table.dart';
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
  String? selectedLeague = 'Premier League';
  final List<String> leagues = [
    'Premier League',
    'La Liga',
    'Bundesliga',
    'Serie A',
    'Ligue 1',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C2C2C),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: 200,
              width: double.infinity,
              child: MatchSchedules(),
            ),
            const SizedBox(height: 20),
            const TitleSection(
              title: 'Match This Week',
              subtitle: 'See All',
            ),
            MatchWeek(),
            const SizedBox(height: 20),
            const TitleSection(
              title: 'Match Day',
              subtitle: 'See All',
            ),
            const MatchDayCard(
              numberOfCards: 2,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DropdownButton<String>(
                    dropdownColor: const Color(0xff2C2C2C),
                    value: selectedLeague,
                    underline: SizedBox(),
                    iconEnabledColor: Colors.white,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLeague = newValue!; // تحديث الدوري المحدد
                      });
                    },
                    items:
                        leagues.map<DropdownMenuItem<String>>((String league) {
                      return DropdownMenuItem<String>(
                        value: league,
                        child: Text(league),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 400, // ارتفاع ثابت لجدول الدوري
              child: LeagueTable(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
