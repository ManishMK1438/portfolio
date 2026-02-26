import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/features/home/home_exports.dart';

class HomeScreenWeb extends StatelessWidget {
  final PortfolioKeys sectionKeys;
  const HomeScreenWeb({super.key, required this.sectionKeys});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: key,
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .start,
        children: [
          kGap100,
          Row(
            children: [
              Flexible(child: IntroColumn()),
              Flexible(
                child: Center(
                  key: sectionKeys.home,
                  child: Image.asset(AppImages.introImage).addShadow(),
                ),
              ),
            ],
          ).addPadding(padding: .symmetric(horizontal: kWebPadding)),
          kGap100,
          BioSection(key: sectionKeys.about),
          kGap80,
          SkillsSection(
            key: sectionKeys.skills,
          ).addPadding(padding: .symmetric(horizontal: kWebPadding)),
          kGap80,
          ProjectsSection(key: sectionKeys.projects),
          kGap90,
          ContactMeSection(
            key: sectionKeys.contact,
          ).addPadding(padding: .symmetric(horizontal: kWebPadding)),
          kGap100,
          Footer(),
        ],
      ),
    );
  }
}
