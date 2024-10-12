import 'package:flutter/material.dart';
import 'package:sportify/features/Detailes_News/presentation/view/widgets/buildBackButton.dart';
import 'package:sportify/features/Detailes_News/presentation/view/widgets/buildImageBackground.dart';

Widget buildHeader({
  required BuildContext context,
  required String imageurl,
}) {
  return Stack(
    children: [
      buildImageBackground(
        imageurl: imageurl,
      ),
      buildBackButton(
        context: context,
      ),
    ],
  );
}
