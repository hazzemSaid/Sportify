import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/widgets/custom_appbar.dart';
import 'package:sportify/features/Home/presentation/viewmodel/match_day/match_day_cubit.dart';

class MatchTableScreen extends StatefulWidget {
  @override
  _MatchTableScreenState createState() => _MatchTableScreenState();
}

class _MatchTableScreenState extends State<MatchTableScreen> {
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<MatchDayCubit>(context).getMatchesbyDate(
      startDate: DateTime.now().toIso8601String().split('T').first,
      dateTo: DateTime.now().toIso8601String().split('T').first,
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C2C2C),
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          //hazem@gmail.com
          //01224661310
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
                            int daysToAdd = daysOfWeek.indexOf(day) -
                                daysOfWeek.indexOf("Today");
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
                            onTap: () {
                              // Handle match tap
                            },
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Team A with logo
                                Row(
                                  children: [
                                    Image.network(
                                      state.matches![index].homeTeam?.crest ??
                                          'default_logo_url', // Replace with actual logo URL
                                      // Replace with actual logo URL
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(
                                        width:
                                            10), // Space between logo and team name
                                    Text(
                                      state.matches![index].homeTeam?.name ??
                                          'Team A', // Replace with actual team name
                                      style:
                                          const TextStyle(color: Colors.white),
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
                                      state.matches![index].awayTeam?.name ??
                                          'Team B', // Replace with actual team name
                                      style:
                                          const TextStyle(color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                        width:
                                            10), // Space between team name and logo
                                    Image.network(
                                      state.matches![index].awayTeam?.crest ??
                                          'default_logo_url',
                                      // Replace with actual logo URL
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
                                    borderRadius: BorderRadius.circular(
                                        10), // Rounded corners
                                  ),
                                  child: Text(
                                    "Time: ${state.matches![index].utcDate}", // Replace with actual match time
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
