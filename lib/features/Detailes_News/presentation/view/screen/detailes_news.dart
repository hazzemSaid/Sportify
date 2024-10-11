import 'package:flutter/material.dart';

class DetailesNews extends StatefulWidget {
  const DetailesNews({super.key});

  @override
  State<DetailesNews> createState() => _DetailesNewsState();
}

class _DetailesNewsState extends State<DetailesNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C2C2C),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        _buildImageBackground(),
        _buildBackButton(),
      ],
    );
  }

  Widget _buildImageBackground() {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1434648957308-5e6a859697e8?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      top: 30,
      left: 5,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff2C2C2C),
            ),
          ),
          const Text(
            'Back',
            style: TextStyle(
              color: Color(0xff2C2C2C),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          const Text(
            'Description',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const Divider(color: Colors.grey, thickness: 0.2),
          Expanded(child: _buildDescriptionText()),
        ],
      ),
    );
  }

  Widget _buildDescriptionText() {
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
}
