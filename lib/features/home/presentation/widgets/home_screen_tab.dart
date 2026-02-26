import 'package:flutter/material.dart';
import 'package:portfolio/features/home/home_exports.dart';

class HomeScreenTab extends StatelessWidget {
  final PortfolioKeys sectionKeys;
  const HomeScreenTab({super.key, required this.sectionKeys});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: key,
      child: Column(children: []),
    );
  }
}
