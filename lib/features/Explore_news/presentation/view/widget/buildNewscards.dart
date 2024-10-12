import 'package:flutter/material.dart';
import 'package:sportify/features/Explore_news/presentation/view/widget/news_card.dart';

Row buildNewsCards({
  String? title1,
  String? image1,
  String? subtitle1,
  VoidCallback? onTap1,
  String? title2,
  String? image2,
  String? subtitle2,
  VoidCallback? onTap2,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      NewsCard(
        title: title1 ?? 'No Title',
        image: image1 ?? 'assets/images/image_news1.png',
        subtitle: subtitle1 ?? 'No Description',
        onTap: onTap1 ?? () {},
      ),
      const SizedBox(width: 15),
      NewsCard(
        title: title2 ?? 'No Title',
        image: image2 ?? 'assets/images/image_news2.png',
        subtitle: subtitle2 ?? 'No Description',
        onTap: onTap2 ?? () {},
      ),
    ],
  );
}
