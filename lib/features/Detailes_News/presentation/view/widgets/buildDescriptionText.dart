import 'package:flutter/material.dart';

Widget buildDescriptionText() {
  return const SingleChildScrollView(
    child: Text(
      "Leeds were so impressive on their return to the top flight last term, picking up 59 points from 38 matches to claim ninth, just two points behind eighth-place Arsenal and three points behind seventh-place Tottenham Hotspur. They also ended the campaign in excellent form. The Whites made a disappointing start to their 2021-22 season, suffering a 5-1 defeat at Manchester United on August 14. Marcelo Bielsa's side are unbeaten in all competitions since then but are still waiting for their first league victory of the campaign. They have shared the points with Everton and Burnley in their last two Premier League fixtures, which came either side of a 3-0 home success over Crewe Alexandra in the EFL Cup. Leeds held Liverpool to a 1-1 draw when the two teams locked horns at Elland Road last term. Bielsa's side were on the wrong end of a seven-goal thriller at Anfield on September 12. It would not be a surprise if there were goals this weekend considering how both teams will approach the match. The Whites will be slightly wary of the dreaded second-season syndrome, and Bielsa will be determined to put a league victory on the board as soon as possible, but a revitalised Liverpool are set to provide difficult opposition for the former League One outfit on Sunday afternoon.",
      style: TextStyle(
        color: Colors.grey,
        fontSize: 14,
      ),
    ),
  );
}
