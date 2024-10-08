import 'package:flutter/material.dart';
import 'package:sportify/features/AuthFeatures/presentation/view/widgets/custom_appbar.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff2C2C2C),
      appBar: CustomAppBar(),
    );
  }
}
