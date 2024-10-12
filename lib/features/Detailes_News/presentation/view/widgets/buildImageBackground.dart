import 'package:flutter/material.dart';

Widget buildImageBackground({
  required String imageurl,
}) {
  return Container(
    height: 300,
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(imageurl),
        fit: BoxFit.cover,
      ),
    ),
  );
}
