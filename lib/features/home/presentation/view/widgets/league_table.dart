import 'package:flutter/material.dart';
import 'package:sportify/features/home/data/model/Standing_League/standings_league/table.dart';

class LeagueTable extends StatelessWidget {
  final List<Tables> teams;
  LeagueTable({
    Key? key,
    required this.teams,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C2C2C),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          itemCount: teams.length + 1, // Add 1 for the header
          itemBuilder: (context, index) {
            if (index == 0) {
              // Header
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 2, child: Text("Team", style: headerTextStyle())),
                    Expanded(child: Text("P", style: headerTextStyle())),
                    Expanded(child: Text("W", style: headerTextStyle())),
                    Expanded(child: Text("D", style: headerTextStyle())),
                    Expanded(child: Text("L", style: headerTextStyle())),
                    Expanded(child: Text("GF/GA", style: headerTextStyle())),
                    Expanded(child: Text("GD", style: headerTextStyle())),
                    Expanded(child: Text("PTS", style: headerTextStyle())),
                  ],
                ),
              );
            } else {
              final team = teams[index - 1]; // Adjust index for team data
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Text(
                              "${team.position}. ",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                            Expanded(
                              child: Text(
                                team.team?.name ?? "",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Center(
                              child: Text("${team.playedGames}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14)))),
                      Expanded(
                          child: Center(
                              child: Text("${team.won}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14)))),
                      Expanded(
                          child: Center(
                              child: Text("${team.draw}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14)))),
                      Expanded(
                          child: Center(
                              child: Text("${team.lost}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14)))),
                      Expanded(
                          child: Center(
                              child: Text("${team.goalDifference}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14)))),
                      Expanded(
                          child: Center(
                              child: Text("${team.goalDifference}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14)))),
                      Expanded(
                          child: Center(
                              child: Text("${team.points}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14)))),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  // Custom header text style
  TextStyle headerTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 13,
    );
  }
}
