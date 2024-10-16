import 'package:flutter/material.dart';
import 'package:sportify/features/MatchTabelDay/presentation/view/widget/match_row.dart';

class MatchListWidget extends StatelessWidget {
  final List<dynamic> matches;
  String leagueName;

  MatchListWidget({
    Key? key,
    required this.matches,
    required this.leagueName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (leagueName == 'La Liga') {
      leagueName = 'Primera Division';
    }

    var filteredMatches = matches
        .where((element) => element['competition']['name'] == leagueName)
        .toList();

    if (filteredMatches.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'No matches today',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      );
    }

    return Column(
      children: List.generate(filteredMatches.length, (index) {
        return MatchRowWidget(
          matchTime: filteredMatches[index]['utcDate']
              .toString()
              .split('T')
              .last
              .split('.')
              .first
              .substring(0, 5),
          logoHome: filteredMatches[index]['homeTeam']["crest"] ?? '',
          nameHome: filteredMatches[index]['homeTeam']["name"] ?? '',
          logoAway: filteredMatches[index]['awayTeam']["crest"] ?? '',
          nameAway: filteredMatches[index]['awayTeam']["name"] ?? '',
        );
      }),
    );
  }
}
