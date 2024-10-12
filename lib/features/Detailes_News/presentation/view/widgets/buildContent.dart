import 'package:flutter/material.dart';
import 'package:sportify/features/Detailes_News/presentation/view/widgets/buildDescriptionText.dart';

Widget buildContent({
  required String description,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        const Text(
          'Description',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.2),
        Expanded(
            child: buildDescriptionText(
          description: description,
        )),
      ],
    ),
  );
}
