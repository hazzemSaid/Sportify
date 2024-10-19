import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/widgets/custom_appbar.dart';
import 'package:sportify/features/MatchTabelDay/presentation/view/widget/leagues_tables.dart';
import 'package:sportify/features/MatchTabelDay/presentation/viewmodel/matchbydate_cubit.dart';

class MatchTableScreen extends StatefulWidget {
  @override
  _MatchTableScreenState createState() => _MatchTableScreenState();
}

class _MatchTableScreenState extends State<MatchTableScreen> {
  String selectedDay = "Today";
  String date = DateTime.now().toIso8601String().split('T').first;

  @override
  List<String> _getDaysAndDatesOfWeek() {
    final today = DateTime.now();
    return List.generate(9, (index) {
      DateTime day = today.add(Duration(days: index - 1));
      return _formatDay(day, index - 1);
    });
  }

  void initState() {
    super.initState();
    print('initState');
    print(DateTime.now().toIso8601String().split('T').first);
    BlocProvider.of<MatchbydateCubit>(context).getMatchesbyDate(
      dateFrom: DateTime.now().toIso8601String().split('T').first,
      dateTo: DateTime.now()
          .add(Duration(days: 1))
          .toIso8601String()
          .split('T')
          .first,
    );
  }

  String _formatDay(DateTime day, int offset) {
    String formattedDay = DateFormat('EEE').format(day);
    String formattedMonth = DateFormat('MMM').format(day);
    switch (offset) {
      case -1:
        return 'Yesterday';
      case 0:
        return 'Today';
      case 1:
        return 'Tomorrow';
      default:
        return '$formattedDay ${day.day} $formattedMonth';
    }
  }

  @override
  void _onDaySelected(String day) {
    setState(() {
      selectedDay = day;

      // Find the index of the day selected from the list
      int index = _getDaysAndDatesOfWeek().indexOf(day);

      // Adjust the selected date by adding (index - 1) days
      DateTime selectedDate = DateTime.now().add(Duration(days: index - 1));

      BlocProvider.of<MatchbydateCubit>(context).getMatchesbyDate(
        dateFrom: selectedDate.toIso8601String().split('T').first,
        dateTo: selectedDate
            .add(Duration(days: 1))
            .toIso8601String()
            .split('T')
            .first,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff2C2C2C),
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildDaySelector(screenWidth),
              const SizedBox(height: 15),
              const LeaguesTables(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDaySelector(double screenWidth) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _getDaysAndDatesOfWeek().length,
        itemBuilder: (context, index) {
          String day = _getDaysAndDatesOfWeek()[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDay = day;
              });
              _onDaySelected(day);
            },
            child: _buildDayChip(day, screenWidth),
          );
        },
      ),
    );
  }

  Widget _buildDayChip(String day, double screenWidth) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding:
          EdgeInsets.symmetric(vertical: 10, horizontal: screenWidth * 0.05),
      decoration: BoxDecoration(
        color: selectedDay == day ? Colors.white : Colors.grey[700],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedDay == day ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
