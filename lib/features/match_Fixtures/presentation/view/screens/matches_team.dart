import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/features/match_Fixtures/data/upcoming/upcoming_cubit.dart';
import 'package:sportify/features/match_Fixtures/presentation/viewmodel/finishedmatches/match_fixtures_cubit.dart';

class TeamDetails extends StatelessWidget {
  final int id;
  final urlimage;

  const TeamDetails({Key? key, required this.id, this.urlimage})
      : super(key: key);

  Widget build(BuildContext context) {
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
                  CachedNetworkImage(
                    imageUrl: urlimage,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  const SizedBox(width: 10),
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
              BlocBuilder<MatchFixturesCubit, MatchFixturesState>(
                builder: (context, state) {
                  if (state is MatchFixturesError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  if (state is MatchFixturesLoaded) {
                    final matches = state.matches;
                    return MatchCard(
                      date: matches?[0]['utcDate'] ?? 'Sat, 16 Feb, 2024',
                      score: (matches?[0]['score']['fullTime']['home']
                                  ?.toString() ??
                              '0') +
                          ' - ' +
                          (matches?[0]['score']['fullTime']['away']
                                  ?.toString() ??
                              '0'),
                      team1: matches?[0]['homeTeam']['shortName'] ?? 'Team 1',
                      team2: matches?[0]['awayTeam']['shortName'] ?? 'Team 2',
                      team1Logo: matches?[0]['homeTeam']['crest'] ??
                          'assets/images/club_logo1.png',
                      team2Logo: matches?[0]['awayTeam']['crest'] ??
                          'assets/images/club_logo2.png',
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
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
              BlocBuilder<UpcomingCubit, UpcomingState>(
                builder: (context, state) {
                  if (state is UpcomingError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  if (state is UpcomingLoaded) {
                    final matches = state.matches;
                    return MatchCard(
                      date: matches?[1]['utcDate'] ?? 'Sat, 16 Feb, 2024',
                      team1: matches?[1]['homeTeam']['shortName'] ?? 'Team 3',
                      team2: matches?[1]['awayTeam']['shortName'] ?? 'Team 4',
                      team1Logo: matches?[1]['homeTeam']['crest'] ??
                          'assets/images/club_logo3.png',
                      team2Logo: matches?[1]['awayTeam']['crest'] ??
                          'assets/images/club_logo.png',
                      score: (matches?[1]['score']['fullTime']['home']
                                  ?.toString() ??
                              '0') +
                          ' - ' +
                          (matches?[1]['score']['fullTime']['away']
                                  ?.toString() ??
                              '0'),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
            ],
          ),
        ),
      ),
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
              CachedNetworkImage(
                imageUrl: team1Logo,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
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
              CachedNetworkImage(
                imageUrl: team2Logo,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
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
/*
class MatchesTeam extends StatelessWidget {
  final List<ModelMatchFixtures> fixtures;
  const MatchesTeam({super.key, required this.fixtures});

  @override
  Widget build(BuildContext context) {
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
                  Image.network(fixtures[0].matches?[0].homeTeam?.crest ??
                      'assets/images/Manchester_City.png'),
                  const SizedBox(width: 10),
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
              MatchCard(
                date: fixtures[0].matches?[0].utcDate ?? 'Sat, 16 Feb, 2024',
                score: (fixtures[0]
                            .matches?[0]
                            .score
                            ?.fullTime
                            ?.home
                            ?.toString() ??
                        '0') +
                    ' - ' +
                    (fixtures[0]
                            .matches?[0]
                            .score
                            ?.fullTime
                            ?.away
                            ?.toString() ??
                        '0'),
                team1: fixtures[0].matches?[0].homeTeam?.shortName ?? 'Team 1',
                team2: fixtures[0].matches?[0].awayTeam?.shortName ?? 'Team 2',
                team1Logo: fixtures[0].matches?[0].homeTeam?.crest ??
                    'assets/images/club_logo1.png',
                team2Logo: fixtures[0].matches?[0].awayTeam?.crest ??
                    'assets/images/club_logo2.png',
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
              MatchCard(
                date: fixtures[0].matches?[1].utcDate ?? 'Sat, 16 Feb, 2024',
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
*/
/*
SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.network(matches?[0].awayTeam?.crest ??
                          'assets/images/Manchester_City.png'),
                      const SizedBox(width: 10),
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
                  MatchCard(
                    date: matches?[0].utcDate ?? 'Sat, 16 Feb, 2024',
                    score: (matches?[0].score?.fullTime?.home?.toString() ??
                            '0') +
                        ' - ' +
                        (matches?[0].score?.fullTime?.away?.toString() ?? '0'),
                    team1: matches?[0].homeTeam?.shortName ?? 'Team 1',
                    team2: matches?[0].awayTeam?.shortName ?? 'Team 2',
                    team1Logo: matches?[0].homeTeam?.crest ??
                        'assets/images/club_logo1.png',
                    team2Logo: matches?[0].awayTeam?.crest ??
                        'assets/images/club_logo2.png',
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
                  MatchCard(
                    date: matches?[1].utcDate ?? 'Sat, 16 Feb, 2024',
                    team1: 'Team 3',
                    team2: 'Team 4',
                    team1Logo: 'assets/images/club_logo3.png',
                    team2Logo: 'assets/images/club_logo.png',
                  )
                ],
              )));*/
