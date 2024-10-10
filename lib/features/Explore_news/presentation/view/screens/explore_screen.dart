import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/widgets/custom_appbar.dart';
import 'package:sportify/features/Explore_news/presentation/view/widget/news_banner.dart';
import 'package:sportify/features/Explore_news/presentation/view/widget/news_card.dart';
import 'package:sportify/features/Explore_news/presentation/view/widget/title_section_explore.dart';
import 'package:sportify/features/Explore_news/presentation/view/widget/top_card_news.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff303030),
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const NewsBanner(),
              const SizedBox(height: 25),
              const TitleSectionExplore(title: 'FIFA WORLD CUP'),
              const SizedBox(height: 10),
              _buildNewsCards(),
              const SizedBox(height: 25),
              Container(
                alignment: Alignment.centerLeft,
                height: 40,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'CRICKET WORLD CUP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const NewsBanner(),
              const SizedBox(height: 25),
              const TitleSectionExplore(title: 'TOP NEWS'),
              const SizedBox(height: 10),
              TopNewsCurd(
                image: 'assets/images/image_news3.png',
                title: 'Qatar World Cup 2022',
                subtitle: 'Messi goals against\nSwitzerland',
                onTap: () {},
              ),
              const SizedBox(height: 15),
              TopNewsCurd(
                image: 'assets/images/image_news4.png',
                title: 'Qatar World Cup 2022',
                subtitle: 'Messi goals against\nSwitzerland',
                onTap: () {},
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildNewsCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NewsCard(
          title: 'Qatar World Cup 2022',
          image: 'assets/images/image_news1.png',
          subtitle: 'Messi goals against\nSwitzerland',
          onTap: () {},
        ),
        const SizedBox(width: 15),
        NewsCard(
          title: 'Qatar World Cup 2022',
          image: 'assets/images/image_news1.png',
          subtitle: 'Messi goals against\nSwitzerland',
          onTap: () {},
        ),
      ],
    );
  }
}
