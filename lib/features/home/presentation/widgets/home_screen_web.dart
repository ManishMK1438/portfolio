import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/features/home/home_exports.dart';

class HomeScreenWeb extends StatelessWidget {
  const HomeScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: key,
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Flexible(child: IntroColumn()),
              Flexible(child: FlutterLogo(size: 200)),
            ],
          ),
          kGap60,
          BioSection().addPadding(padding: .all(30)),
          kGap60,
          ProjectsSection().addPadding(padding: .all(30)),
          kGap60,
          SkillsSection().addPadding(padding: .all(30)),
        ],
      ),
    );
  }
}
