import 'package:flutter/material.dart';

class LeagueTable extends StatelessWidget {
  final List<Map<String, dynamic>> teams = [
    {
      "rank": 1,
      "team": "Chelsea",
      "p": 11,
      "w": 8,
      "d": 2,
      "l": 1,
      "gfGa": "27/4",
      "gd": "+23",
      "pts": 26
    },
    {
      "rank": 2,
      "team": "Man. City",
      "p": 11,
      "w": 7,
      "d": 2,
      "l": 2,
      "gfGa": "22/6",
      "gd": "+16",
      "pts": 23
    },
    {
      "rank": 3,
      "team": "West Ham",
      "p": 11,
      "w": 7,
      "d": 2,
      "l": 2,
      "gfGa": "23/13",
      "gd": "+10",
      "pts": 23
    },
    {
      "rank": 4,
      "team": "Liverpool",
      "p": 11,
      "w": 6,
      "d": 4,
      "l": 1,
      "gfGa": "31/11",
      "gd": "+20",
      "pts": 22
    },
    {
      "rank": 5,
      "team": "Arsenal",
      "p": 11,
      "w": 6,
      "d": 2,
      "l": 3,
      "gfGa": "13/13",
      "gd": "0",
      "pts": 20
    },
    {
      "rank": 6,
      "team": "Man. United",
      "p": 11,
      "w": 5,
      "d": 2,
      "l": 4,
      "gfGa": "19/17",
      "gd": "+2",
      "pts": 17
    },
    {
      "rank": 7,
      "team": "Brighton",
      "p": 11,
      "w": 4,
      "d": 5,
      "l": 2,
      "gfGa": "12/12",
      "gd": "0",
      "pts": 17
    },
    {
      "rank": 8,
      "team": "Wolverhampton",
      "p": 11,
      "w": 5,
      "d": 1,
      "l": 5,
      "gfGa": "11/12",
      "gd": "-1",
      "pts": 16
    },
    {
      "rank": 9,
      "team": "Leicester City",
      "p": 11,
      "w": 4,
      "d": 4,
      "l": 3,
      "gfGa": "18/20",
      "gd": "-2",
      "pts": 16
    },
    {
      "rank": 10,
      "team": "Everton",
      "p": 11,
      "w": 4,
      "d": 3,
      "l": 4,
      "gfGa": "15/15",
      "gd": "0",
      "pts": 15
    },
    {
      "rank": 11,
      "team": "Aston Villa",
      "p": 11,
      "w": 3,
      "d": 5,
      "l": 3,
      "gfGa": "13/14",
      "gd": "-1",
      "pts": 14
    },
    {
      "rank": 12,
      "team": "Crystal Palace",
      "p": 11,
      "w": 3,
      "d": 5,
      "l": 3,
      "gfGa": "11/15",
      "gd": "-4",
      "pts": 14
    },
    {
      "rank": 13,
      "team": "Newcastle",
      "p": 11,
      "w": 3,
      "d": 3,
      "l": 5,
      "gfGa": "16/19",
      "gd": "-3",
      "pts": 12
    },
    {
      "rank": 14,
      "team": "Southampton",
      "p": 11,
      "w": 2,
      "d": 5,
      "l": 4,
      "gfGa": "12/17",
      "gd": "-5",
      "pts": 11
    },
    {
      "rank": 15,
      "team": "Burnley",
      "p": 11,
      "w": 2,
      "d": 4,
      "l": 5,
      "gfGa": "10/20",
      "gd": "-10",
      "pts": 10
    },
    {
      "rank": 16,
      "team": "Fulham",
      "p": 11,
      "w": 2,
      "d": 3,
      "l": 6,
      "gfGa": "14/25",
      "gd": "-11",
      "pts": 9
    },
    {
      "rank": 17,
      "team": "Brentford",
      "p": 11,
      "w": 1,
      "d": 6,
      "l": 4,
      "gfGa": "11/17",
      "gd": "-6",
      "pts": 9
    },
    {
      "rank": 18,
      "team": "Nottingham Forest",
      "p": 11,
      "w": 2,
      "d": 3,
      "l": 6,
      "gfGa": "8/20",
      "gd": "-12",
      "pts": 9
    },
    {
      "rank": 19,
      "team": "Sheffield United",
      "p": 11,
      "w": 1,
      "d": 2,
      "l": 8,
      "gfGa": "9/27",
      "gd": "-18",
      "pts": 5
    },
    {
      "rank": 20,
      "team": "Luton Town",
      "p": 11,
      "w": 1,
      "d": 2,
      "l": 8,
      "gfGa": "5/25",
      "gd": "-20",
      "pts": 5
    },
  ];

  LeagueTable({super.key});

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 1, child: Text("Team", style: headerTextStyle())),
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
                              "${team["rank"]}. ",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                            Expanded(
                              child: Text(
                                team["team"],
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
                              child: Text(team["p"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14)))),
                      Expanded(
                          child: Center(
                              child: Text(team["w"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14)))),
                      Expanded(
                          child: Center(
                              child: Text(team["d"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14)))),
                      Expanded(
                          child: Center(
                              child: Text(team["l"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14)))),
                      Expanded(
                          child: Center(
                              child: Text(team["gfGa"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14)))),
                      Expanded(
                          child: Center(
                              child: Text(team["gd"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14)))),
                      Expanded(
                          child: Center(
                              child: Text(team["pts"].toString(),
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
