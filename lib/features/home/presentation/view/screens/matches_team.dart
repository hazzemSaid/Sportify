import 'package:flutter/material.dart';

class Team {
  final String name;
  final String league;
  final String logoPath;

  Team({
    required this.name,
    required this.league,
    required this.logoPath,
  });
}

class TeamLogo extends StatelessWidget {
  final String logoPath;
  final double size;

  const TeamLogo({
    Key? key,
    required this.logoPath,
    this.size = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      logoPath,
      width: size,
      height: size,
    );
  }
}

class TeamInfo extends StatelessWidget {
  final Team team;

  const TeamInfo({
    Key? key,
    required this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          team.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          team.league,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class MatchCard extends StatelessWidget {
  final String date;
  final String? score;
  final String team1;
  final String team2;
  final String team1Logo;
  final String team2Logo;

  const MatchCard({
    Key? key,
    required this.date,
    this.score,
    required this.team1,
    required this.team2,
    required this.team1Logo,
    required this.team2Logo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff2C2C2C),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                team1,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                team1Logo,
                width: 28,
                height: 28,
              ),
              const SizedBox(width: 10),
              Container(
                height: 28,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[800],
                ),
                child: Center(
                  child: Text(
                    score ?? '15:00',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                team2Logo,
                width: 28,
                height: 28,
              ),
              const SizedBox(width: 10),
              Text(
                team2,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Divider(
            color: Colors.grey[800],
            thickness: 1,
          ),
        ],
      ),
    );
  }
}

class MatchesTeam extends StatelessWidget {
  const MatchesTeam({super.key});

  @override
  Widget build(BuildContext context) {
    Team team = Team(
      name: 'Man City',
      league: 'Premier League',
      logoPath: 'assets/images/Manchester_City.png',
    );

    return Scaffold(
      backgroundColor: const Color(0xff2C2C2C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TeamLogo(logoPath: team.logoPath),
                  const SizedBox(width: 10),
                  TeamInfo(team: team),
                ],
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Matches',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const MatchCard(
                date: 'Fri, 15 Feb, 2024',
                score: '0 - 1',
                team1: 'Team 1',
                team2: 'Team 2',
                team1Logo: 'assets/images/club_logo1.png',
                team2Logo: 'assets/images/club_logo2.png',
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Upcoming Matches',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const MatchCard(
                date: 'Sat, 16 Feb, 2024',
                team1: 'Team 3',
                team2: 'Team 4',
                team1Logo: 'assets/images/club_logo3.png',
                team2Logo: 'assets/images/club_logo.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
