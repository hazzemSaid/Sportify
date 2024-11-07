import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildSocialButton(String image, VoidCallback onTap, String text) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 45,
      width: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: const Color(0xff353535),
        border: Border.all(width: 0.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
          ),
          SvgPicture.asset(
            image,
            height: 30,
            width: 30,
          ),
          Spacer(
            flex: 2,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Spacer(
            flex: 3,
          ),
        ],
      ),
    ),
  );
}
