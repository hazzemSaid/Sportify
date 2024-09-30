import 'package:flutter/material.dart';

class MatchDayCard extends StatelessWidget {
  final int numberOfCards;

  const MatchDayCard({
    super.key,
    required this.numberOfCards,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children:
              List.generate(numberOfCards, (index) => _buildMatchCard(index)),
        ),
      ),
    );
  }

  Widget _buildMatchCard(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        height: 180,
        width: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xff353535),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLeagueLogo(),
              const SizedBox(height: 25),
              _buildClubLogos(),
              const SizedBox(height: 25),
              _buildMatchTime(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeagueLogo() {
    return Image.asset('assets/images/league_logo.png');
  }

  Widget _buildClubLogos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildClubColumn('assets/images/club_logo1.png', 'Leeds United'),
        const Text(
          'VS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        _buildClubColumn('assets/images/club_logo2.png', 'Leeds United'),
      ],
    );
  }

  Widget _buildClubColumn(String logoPath, String clubName) {
    return Column(
      children: [
        Image.asset(logoPath),
        const SizedBox(height: 12),
        Text(
          clubName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildMatchTime() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Today - 12:00 PM',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
