import 'package:flutter/material.dart';
import 'package:sportify/features/Detailes_News/presentation/view/widgets/buildContent.dart';

import '../widgets/buildHeader.dart';

class DetailesNews extends StatefulWidget {
  final String imageurl;
  final String description;

  const DetailesNews(
      {super.key, required this.imageurl, required this.description});

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
          buildHeader(
            imageurl: widget.imageurl,
            context: context,
          ),
          Expanded(
            child: buildContent(
              description: widget.description,
            ),
          ),
        ],
      ),
    );
  }
}
