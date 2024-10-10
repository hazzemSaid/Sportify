import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewsBanner extends StatelessWidget {
  const NewsBanner({super.key, this.onTap});

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 210,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://images.unsplash.com/photo-1519743375942-b497d66b1e8f?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewsCategoryLabel(),
              SizedBox(height: 5),
              NewsTitle(title: "LIVERPOOL VS MANCHESTER CITY"),
              NewsDetails(),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsCategoryLabel extends StatelessWidget {
  const NewsCategoryLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 85,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/fire.svg',
                  width: 12,
                  height: 12,
                ),
                const SizedBox(width: 3),
                const Text(
                  'Top News',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewsTitle extends StatelessWidget {
  const NewsTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'FootBall .',
          style: TextStyle(
            color: Color(0xff00A3B7),
            fontSize: 14,
          ),
        ),
        SizedBox(width: 3),
        Text(
          'Wednesday, 12, 2024 .',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        SizedBox(width: 3),
        Text(
          '10:00 PM',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
