import 'package:flutter/material.dart';
import 'package:portfolio/features/home/domain/entity/portfolio_keys.dart';

class HomeScreenMobile extends StatelessWidget {
  final PortfolioKeys sectionKeys;
  const HomeScreenMobile({super.key, required this.sectionKeys});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: key,
      child: Column(children: []),
    );
  }
}
