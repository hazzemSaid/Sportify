import 'package:flutter/material.dart';

Widget buildBackButton({
  required BuildContext context,
}) {
  return Positioned(
    top: 30,
    left: 5,
    child: Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff2C2C2C),
          ),
        ),
        const Text(
          'Back',
          style: TextStyle(
            color: Color(0xff2C2C2C),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
