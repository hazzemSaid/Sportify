import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MatchRowWidget extends StatelessWidget {
  final String logoHome;
  final String nameHome;
  final String logoAway;
  final String nameAway;
  final String matchTime;

  const MatchRowWidget({
    super.key,
    required this.logoHome,
    required this.nameHome,
    required this.logoAway,
    required this.nameAway,
    required this.matchTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
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
            child: Center(
              child: Text(
                matchTime,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          const Spacer(flex: 1),
          _buildClubInfo(logoAway, nameAway),
        ],
      ),
    );
  }

  Widget _buildClubInfo(String logoPath, String clubName) {
    return Row(
      children: [
        CachedNetworkImage(imageUrl: logoPath, height: 30, width: 30),
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
