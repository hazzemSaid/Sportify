import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/core/utils/constrains/ids.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/widgets/custom_appbar.dart';
import 'package:sportify/features/Home/presentation/view/widgets/league_table.dart';
import 'package:sportify/features/Home/presentation/view/widgets/match_day_card.dart';
import 'package:sportify/features/Home/presentation/view/widgets/match_schedules.dart';
import 'package:sportify/features/Home/presentation/view/widgets/match_week.dart';
import 'package:sportify/features/Home/presentation/view/widgets/title_section.dart';
import 'package:sportify/features/Home/presentation/viewmodel/match_day/match_day_cubit.dart';
import 'package:sportify/features/Home/presentation/viewmodel/standing_cubit/standing_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();
    BlocProvider.of<MatchDayCubit>(context).getMatchesbyDate(
      startDate: DateTime.now().toIso8601String().split('T').first,
      dateTo: DateTime.now().toIso8601String().split('T').first,
    );
  }

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
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: MatchWeek(),
            ),
            const SizedBox(height: 20),
            const TitleSection(
              title: 'Match Day',
            ),
            BlocBuilder<MatchDayCubit, MatchDayState>(
              builder: (context, state) {
                if (state is MatchDayInitial) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                } else if (state is MatchDayLoaded) {
                  return MatchDayCard(matches: state.matches ?? []);
                } else if (state is MatchDayError) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DropdownButton<String>(
                    dropdownColor: const Color(0xff2C2C2C),
                    value: selectedLeague,
                    underline: const SizedBox(),
                    iconEnabledColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        BlocProvider.of<StandingCubit>(context)
                            .getStandingByLeague(
                                league:
                                    FootballData.leagueMap[newValue] ?? 'PL',
                                season: '2024',
                                matchDay: 7);
                      } else {
                        BlocProvider.of<StandingCubit>(context)
                            .getStandingByLeague(
                                league: 'PL', season: '2024', matchDay: 7);
                      }
                      setState(() {
                        selectedLeague = newValue;
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
            BlocBuilder<StandingCubit, StandingState>(
              builder: (context, state) {
                if (state is StandingInitial) {
                  return Container(
                    height: 400,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ),
                  );
                } else if (state is StandingLoaded) {
                  return Container(
                    height: 400,
                    child: LeagueTable(teams: state.teams),
                  );
                } else if (state is StandingError) {
                  return Container(
                    height: 400,
                    child: Center(
                      child: Text(state.message),
                    ),
                  );
                }
                return Container(
                  height: 400,
                  width: double.infinity,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
