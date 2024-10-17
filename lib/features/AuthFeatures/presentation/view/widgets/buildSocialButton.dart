import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildSocialButton(String image, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xff353535),
        border: Border.all(width: 0.3),
      ),
      child: SvgPicture.asset(
        image,
      ),
    ),
  );
}
