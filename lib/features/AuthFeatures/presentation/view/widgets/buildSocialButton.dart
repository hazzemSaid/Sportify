import 'package:flutter/material.dart';

Widget buildSocialButton(IconData icon, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xff353535),
        border: Border.all(width: 0.3),
      ),
      child: Icon(icon, size: 35, color: Colors.blue[800]),
    ),
  );
}
