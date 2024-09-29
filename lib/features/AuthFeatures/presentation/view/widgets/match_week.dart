import 'package:flutter/material.dart';

class MatchWeek extends StatelessWidget {
  MatchWeek({super.key});

  final List<String> imgList = [
    'assets/images/match_week1.png',
    'assets/images/match_week2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Horizontal scroll
      child: Row(
        children: List.generate(
          imgList.length, // Loop through image list
          (index) => Padding(
            padding:
                const EdgeInsets.only(left: 15), // Add padding between items
            child: Container(
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(imgList[index]),
                  fit: BoxFit.cover, // Adjust how the image fits the container
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
