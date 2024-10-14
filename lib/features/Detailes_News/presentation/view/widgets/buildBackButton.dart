import 'package:flutter/material.dart';

Widget buildBackButton({
  required BuildContext context,
}) {
  return Positioned(
    top: 40,
    child: Row(
      children: [
        Container(
          width: 100,
          height: 32,
          decoration: const BoxDecoration(
            color: Color(0xff2C2C2C),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const Text(
                'Back',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
