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
  List<String> getDaysOfWeek() {
    DateTime today = DateTime.now();
    List<String> days = [];

    for (int i = -1; i <= 7; i++) {
      DateTime day = today.add(Duration(days: i));
      String dayLabel = i == -1
          ? 'Yesterday'
          : i == 0
              ? 'Today'
              : i == 1
                  ? 'Tomorrow'
                  : DateFormat.EEEE().format(day);
      days.add(dayLabel);
    }

    return days;
  }

  String selectedDay = "Today";

  @override
  Widget build(BuildContext context) {
    // Get screen width to adjust sizes dynamically
    final screenWidth = MediaQuery.of(context).size.width;

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
                itemCount: getDaysOfWeek().length,
                itemBuilder: (context, index) {
                  String day = getDaysOfWeek()[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDay = day;
                        DateTime today = DateTime.now();
                        DateTime startDate;
                        DateTime endDate;

                        switch (day) {
                          case "Yesterday":
                            startDate = today.subtract(const Duration(days: 1));
                            endDate = startDate;
                            break;
                          case "Today":
                            startDate = today;
                            endDate = startDate;
                            break;
                          case "Tomorrow":
                            startDate = today.add(const Duration(days: 1));
                            endDate = startDate;
                            break;
                          default:
                            int daysToAdd = getDaysOfWeek().indexOf(day) -
                                getDaysOfWeek().indexOf("Today");
                            startDate = today.add(Duration(days: daysToAdd));
                            endDate = startDate;
                            break;
                        }
                        endDate = endDate.add(const Duration(days: 1));
                        BlocProvider.of<MatchDayCubit>(context)
                            .getMatchesbyDate(
                          startDate:
                              startDate.toIso8601String().split('T').first,
                          dateTo: endDate.toIso8601String().split('T').first,
                        );
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal:
                            screenWidth * 0.05, // Adjusted based on screen size
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
            BlocBuilder<MatchDayCubit, MatchDayState>(
              builder: (context, state) {
                if (state is MatchDayInitial) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                }
                if (state is MatchDayLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.matches?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          color: Colors.grey[900],
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Home team row
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Image.network(
                                        state.matches![index].homeTeam?.crest ??
                                            'default_logo_url',
                                        width: screenWidth * 0.08,
                                        height: screenWidth * 0.08,
                                        fit: BoxFit
                                            .contain, // Keep the image size consistent
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          state.matches![index].homeTeam
                                                  ?.name ??
                                              'Team A',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'vs',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          state.matches![index].awayTeam
                                                  ?.name ??
                                              'Team B',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          textAlign: TextAlign
                                              .end, // Align text to the right
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Image.network(
                                        state.matches![index].awayTeam?.crest ??
                                            'default_logo_url',
                                        width: screenWidth * 0.08,
                                        height: screenWidth * 0.08,
                                        fit: BoxFit.contain,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(
                                top: 15.0,
                                left: 8.0,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5.0,
                                    horizontal: 10.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[700],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    "Time: ${state.matches![index].utcDate}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                if (state is MatchDayError) {
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
            )
          ],
        ),
      ),
    );
  }
}
