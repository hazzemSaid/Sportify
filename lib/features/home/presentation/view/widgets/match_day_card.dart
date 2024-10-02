// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../data/model/matchesbydate/match.dart';

class MatchDayCard extends StatelessWidget {
  List<Matche> matches;
  MatchDayCard({
    super.key,
    required this.matches,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(children: [
          for (int i = 0; i < matches.length; i++) _buildMatchCard(i),
        ]),
      ),
    );
  }

  Widget _buildMatchCard(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        height: 200,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xff353535),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLeagueLogo(
                matches[index].competition!.emblem!,
              ),
              const SizedBox(height: 25),
              _buildClubLogos(
                matches[index].homeTeam!.shortName!,
                matches[index].homeTeam!.crest!,
                matches[index].awayTeam!.crest!,
                matches[index].awayTeam!.shortName!,
              ),
              const SizedBox(height: 25),
              _buildMatchTime(
                matches[index].utcDate!,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeagueLogo(String s) {
    return Image.network(
      s,
      height: 30,
    );
  }

  Widget _buildClubLogos(
    String homeTeamName,
    String homeTeamCrest,
    String awayTeamCrest,
    String awayTeamName,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildClubColumn(
          homeTeamCrest,
          homeTeamName,
        ),
        const Text(
          'VS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        _buildClubColumn(
          awayTeamCrest,
          awayTeamName,
        ),
      ],
    );
  }

  Widget _buildClubColumn(String logoPath, String clubName) {
    return Column(
      children: [
        Image.network(
          logoPath,
          height: 30,
        ),
        const SizedBox(height: 12),
        Text(
          clubName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildMatchTime(
    String utcDate,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 20,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Text(
            //reformat the date to show only the time
            utcDate.split('T').last.substring(0, 5) + ' PM',
            //reformat the date to show only the date
            // '${utcDate.split('T').first}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
