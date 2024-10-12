import 'package:flutter/material.dart';

Widget buildImageBackground() {
  return Container(
    height: 300,
    width: double.infinity,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
          'https://images.unsplash.com/photo-1434648957308-5e6a859697e8?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ),
        fit: BoxFit.cover,
      ),
    ),
  );
}
