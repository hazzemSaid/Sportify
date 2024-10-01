import 'package:flutter/material.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/widgets/custom_appbar.dart';

class MatchTableScreen extends StatefulWidget {
  @override
  _MatchTableScreenState createState() => _MatchTableScreenState();
}

class _MatchTableScreenState extends State<MatchTableScreen> {
  final List<String> daysOfWeek = [
    "Yesterday",
    "Today",
    "Tomorrow",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  String selectedDay = "Today";
  final Map<String, List<Match>> matchesByDay = {
    "Today": [Match(teamA: "Leeds United", teamB: "Liverpool", time: "18:00")],
    "Tomorrow": [Match(teamA: "Team C", teamB: "Team D", time: "20:00")],
    // Add more days and matches here...
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C2C2C),
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: daysOfWeek.length,
                itemBuilder: (context, index) {
                  String day = daysOfWeek[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDay = day;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: selectedDay == day
                            ? Colors.white
                            : Colors.grey[700],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          day,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedDay == day
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: matchesByDay[selectedDay]?.length ?? 0,
                itemBuilder: (context, index) {
                  final match = matchesByDay[selectedDay]?[index];
                  return Card(
                    elevation: 5,
                    color: Colors.grey[900],
                    child: ListTile(
                      onTap: () {
                        // Handle match tap
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Team A with logo
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/club_logo1.png', // Replace with actual logo URL
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(
                                  width:
                                      10), // Space between logo and team name
                              Text(
                                match!.teamA,
                                style: const TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const Text(
                            'vs',
                            style: TextStyle(color: Colors.white),
                          ),
                          // Team B with logo
                          Row(
                            children: [
                              Text(
                                match.teamB,
                                style: const TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                  width:
                                      10), // Space between team name and logo
                              Image.asset(
                                'assets/images/club_logo2.png', // Replace with actual logo URL
                                width: 30,
                                height: 30,
                              ),
                            ],
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                          left: 8.0,
                        ), // Add vertical space here
                        child: Align(
                          alignment: Alignment
                              .center, // Align the container to the left
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ), // Padding inside the container
                            decoration: BoxDecoration(
                              color: Colors.grey[700], // Background color
                              borderRadius:
                                  BorderRadius.circular(10), // Rounded corners
                            ),
                            child: Text(
                              "Time: ${match.time}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Match {
  final String teamA;
  final String teamB;
  final String time;

  Match({required this.teamA, required this.teamB, required this.time});
}
