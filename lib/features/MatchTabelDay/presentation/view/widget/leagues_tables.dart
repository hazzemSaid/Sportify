import 'package:flutter/material.dart';
import 'package:sportify/features/MatchTabelDay/presentation/view/widget/table_matches.dart';

class LeaguesTables extends StatefulWidget {
  const LeaguesTables({super.key});

  @override
  State<LeaguesTables> createState() => _LeaguesTablesState();
}

class _LeaguesTablesState extends State<LeaguesTables> {
  String date = DateTime.now().toIso8601String().split('T').first;

  @override
  Widget build(BuildContext context) {
    const leagues = [
      {'name': 'Premier League', 'logo': 'assets/images/premier-league.png'},
      {'name': 'La Liga', 'logo': 'assets/images/la_liga.png'},
      {'name': 'Bundesliga', 'logo': 'assets/images/bundesliga.png'},
      {'name': 'Serie A', 'logo': 'assets/images/serie_a.png'},
      {'name': 'Ligue 1', 'logo': 'assets/images/ligue_1.png'},
    ];

    return Column(
      children: leagues.map((league) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TableMatches(
            date: date,
            leagueName: league['name']!,
            logoLeague: league['logo']!,
          ),
        );
      }).toList(),
    );
  }
}
