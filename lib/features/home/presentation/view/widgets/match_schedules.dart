import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/images/match_1.png',
  'assets/images/match_2.png',
  'assets/images/match_3.png',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(0.5),
          decoration: BoxDecoration(
            color: const Color(0xff2C2C2C),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              children: <Widget>[
                Container(
                  color: const Color(0xff2C2C2C),
                  child: Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ))
    .toList();

class MatchSchedules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C2C2C),
      body: Container(
        width: double.infinity,
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            initialPage: 1,
            autoPlay: true,
          ),
          items: imageSliders,
        ),
      ),
    );
  }
}
