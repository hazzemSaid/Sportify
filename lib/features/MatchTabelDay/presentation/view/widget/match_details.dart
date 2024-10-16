import 'package:flutter/material.dart';
import 'package:sportify/features/MatchTabelDay/presentation/view/widget/match_list.dart';

class MatchDetailsWidget extends StatelessWidget {
  final List<dynamic> matches;
  final String leagueName;

  const MatchDetailsWidget({
    Key? key,
    required this.matches,
    required this.leagueName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: MatchListWidget(
          matches: matches,
          leagueName: leagueName,
        ),
      ),
    );
  }
}
