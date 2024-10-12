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
  String selectedDay = "Today";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchMatchesForToday();
  }

  void _fetchMatchesForToday() {
    final today = DateTime.now().toIso8601String().split('T').first;
    BlocProvider.of<MatchDayCubit>(context).getMatchesbyDate(
      startDate: today,
      dateTo: today,
    );
  }

  List<String> _getDaysAndDatesOfWeek() {
    final today = DateTime.now();
    return List.generate(9, (index) {
      DateTime day = today.add(Duration(days: index - 1));
      return _formatDay(day, index - 1);
    });
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

  void _onDaySelected(String day) {
    setState(() {
      selectedDay = day;
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
              _buildLeagueTables(),
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
            onTap: () => _onDaySelected(day),
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

  Widget _buildLeagueTables() {
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
          padding: const EdgeInsets.only(bottom: 15),
          child: TableMatches(
            leagueName: league['name']!,
            logoLeague: league['logo']!,
          ),
        );
      }).toList(),
    );
  }
}

class TableMatches extends StatefulWidget {
  const TableMatches(
      {super.key, required this.leagueName, required this.logoLeague});

  final String leagueName;
  final String logoLeague;

  @override
  State<TableMatches> createState() => _TableMatchesState();
}

class _TableMatchesState extends State<TableMatches> {
  bool isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleExpansion,
          child: _buildLeagueHeader(),
        ),
        if (isExpanded) _buildMatchDetails(),
      ],
    );
  }

  Widget _buildLeagueHeader() {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Image.asset(widget.logoLeague, height: 30, width: 30),
            const SizedBox(width: 5),
            Text(
              widget.leagueName,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchDetails() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: _buildMatchList(),
      ),
    );
  }

  Widget _buildMatchList() {
    // قائمة الفرق
    final List<Map<String, String>> matches = [
      {
        'logoHome': 'assets/images/club_logo2.png',
        'nameHome': 'Liverpool FC',
        'logoAway': 'assets/images/club_logo.png',
        'nameAway': 'Chelsea FC',
      },
      {
        'logoHome': 'assets/images/club_logo3.png',
        'nameHome': 'Manchester United',
        'logoAway': 'assets/images/club_logo2.png',
        'nameAway': 'Arsenal',
      },
      // يمكنك إضافة المزيد من المباريات هنا
    ];

    return Column(
      children: matches.map((match) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: _buildMatchRow(
            match['logoHome']!,
            match['nameHome']!,
            match['logoAway']!,
            match['nameAway']!,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMatchRow(
      String logoHome, String nameHome, String logoAway, String nameAway) {
    return Row(
      children: [
        _buildClubInfo(logoHome, nameHome),
        const Spacer(flex: 1),
        Container(
            width: 50,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Text('15:00',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            )),
        const Spacer(flex: 1),
        _buildClubInfo(logoAway, nameAway),
      ],
    );
  }

  Widget _buildClubInfo(String logoPath, String clubName) {
    return Row(
      children: [
        Image.asset(logoPath, height: 25, width: 25),
        const SizedBox(width: 5),
        SizedBox(
          width: 90,
          child: Text(
            clubName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
