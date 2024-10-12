import 'package:flutter/material.dart';
import 'package:sportify/features/Detailes_News/presentation/view/widgets/buildBackButton.dart';
import 'package:sportify/features/Detailes_News/presentation/view/widgets/buildContent.dart';
import 'package:sportify/features/Detailes_News/presentation/view/widgets/buildDescriptionText.dart';
import 'package:sportify/features/Detailes_News/presentation/view/widgets/buildImageBackground.dart';

import '../widgets/buildHeader.dart';

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
          buildHeader(
            context: context,
          ),
          Expanded(
            child: buildContent(),
          ),
        ],
      ),
    );
  }
}
