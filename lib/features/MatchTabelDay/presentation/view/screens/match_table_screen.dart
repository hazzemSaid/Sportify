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

  bool isExpanded = false;
  String selectedDay = "Today";
  String selectedMatch = "Select Match"; // Dropdown initial value
  List<Map<String, String>> matches = [];

  @override
  void initState() {
    super.initState();
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
          right: 8,
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
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded; // تغيير حالة العرض عند الضغط
                });
              },
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/premier-league.png',
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'League Name',
                        style: TextStyle(color: Colors.white),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isExpanded,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Team 1',
                        style: TextStyle(color: Colors.white), // لون النص
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Team 2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Team 3',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
