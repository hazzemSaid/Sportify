import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/widgets/custom_appbar.dart';
import 'package:sportify/features/Home/presentation/viewmodel/match_day/match_day_cubit.dart';

class MatchTableScreen extends StatefulWidget {
  @override
  _MatchTableScreenState createState() => _MatchTableScreenState();
}

class _MatchTableScreenState extends State<MatchTableScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<MatchDayCubit>(context).getMatchesbyDate(
      startDate: DateTime.now().toIso8601String().split('T').first,
      dateTo: DateTime.now().toIso8601String().split('T').first,
    );
  }

  // Generate dynamic days based on current day
  List<String> getDaysAndDatesOfWeek() {
    DateTime today = DateTime.now();
    List<String> days = [];

    for (int i = -1; i <= 7; i++) {
      DateTime day = today.add(Duration(days: i));
      String formattedDay = DateFormat('EEE').format(day);
      String formattedMonth = DateFormat('MMM').format(day);
      String dayLabel = i == -1
          ? 'Yesterday'
          : i == 0
              ? 'Today'
              : i == 1
                  ? 'Tomorrow'
                  : '$formattedDay ${day.day} $formattedMonth';
      days.add(dayLabel);
    }

    return days;
  }

  String selectedDay = "Today";
  String selectedMatch = "Select Match"; // Dropdown initial value
  List<Map<String, String>> matches = [];

  @override
  void initState() {
    super.initState();
    // Add match data (make sure there are no duplicates in the team names)
    matches = [
      {
        'team1': 'Team A',
        'team2': 'Team B',
        'time': '18:00',
        'image1': 'assets/images/club_logo3.png',
        'image2': 'assets/images/club_logo2.png',
      },
      {
        'team1': 'Team C',
        'team2': 'Team D',
        'time': '20:00',
        'image1': 'assets/images/club_logo.png',
        'image2': 'assets/images/club_logo1.png',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff2C2C2C),
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 8,
        ),
        child: Column(
          children: [
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: getDaysAndDatesOfWeek().length,
                itemBuilder: (context, index) {
                  String day = getDaysAndDatesOfWeek()[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDay = day;
                        DateTime today = DateTime.now();
                        DateTime startDate;
                        DateTime endDate;

                        if (day.contains("Yesterday")) {
                          startDate = today.subtract(const Duration(days: 1));
                        } else if (day.contains("Today")) {
                          startDate = today;
                        } else if (day.contains("Tomorrow")) {
                          startDate = today.add(const Duration(days: 1));
                        } else {
                          int daysToAdd = getDaysAndDatesOfWeek().indexOf(day) -
                              getDaysAndDatesOfWeek().indexOf("Today");
                          startDate = today.add(Duration(days: daysToAdd));
                        }

                        endDate = startDate;
                        /*  BlocProvider.of<MatchDayCubit>(context)
                            .getMatchesbyDate(
                          startDate:
                              startDate.toIso8601String().split('T').first,
                          dateTo: endDate
                              .add(const Duration(days: 1))
                              .toIso8601String()
                              .split('T')
                              .first,
                        );*/
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: screenWidth * 0.05,
                      ),
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
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: screenWidth,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: DropdownButton<String>(
                    value: selectedMatch,
                    dropdownColor: Colors.grey[700],
                    iconEnabledColor: Colors.white,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    items: [
                      DropdownMenuItem<String>(
                        value: "Select Match",
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/league_logo.png",
                            ),
                            SizedBox(width: 8),
                            Text("League Name",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      ...matches.map((match) {
                        String displayName = match['team1']! +
                            (match['team2']!.isNotEmpty
                                ? match['time']! + match['team2']!
                                : '');
                        return DropdownMenuItem<String>(
                          value: displayName,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  if (match['image1']!.isNotEmpty)
                                    Image.asset(
                                      match['image1']!,
                                      width: 30,
                                      height: 30,
                                    ),
                                  SizedBox(width: 8),
                                  Text(match['team1']!,
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              if (match['team2']!.isNotEmpty)
                                Text(match['time']!,
                                    style: TextStyle(color: Colors.white)),
                              Row(
                                children: [
                                  if (match['image2']!.isNotEmpty)
                                    Image.asset(
                                      match['image2']!,
                                      width: 30,
                                      height: 30,
                                    ),
                                  SizedBox(width: 8),
                                  Text(match['team2']!,
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                    onChanged: (String? newValue) {
                      if (newValue != null) {}
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
