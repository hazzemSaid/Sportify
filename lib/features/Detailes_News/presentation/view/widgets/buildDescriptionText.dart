import 'package:flutter/material.dart';

Widget buildDescriptionText({
  required String description,
}) {
  return SingleChildScrollView(
    child: Text(
      description,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 14,
      ),
    ),
  );
}
