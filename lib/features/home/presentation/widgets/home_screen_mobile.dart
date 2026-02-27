import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/features/home/home_exports.dart';

class HomeScreenMobile extends StatelessWidget {
  final PortfolioKeys sectionKeys;

  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;
  const HomeScreenMobile({
    super.key,
    required this.sectionKeys,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: key,
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .start,
        children: [
          kGap100,
          Column(
            crossAxisAlignment: .center,
            children: [
              IntroColumn(
                key: sectionKeys.home,
                isDesktop: false,
                onProjectsTap: onProjectsTap,
                onContactTap: onContactTap,
              ),
              kGap40,
              Center(child: Image.asset(AppImages.introImage).addShadow()),
            ],
          ).addPadding(padding: .symmetric(horizontal: kAppPadding)),
          kGap100,
          BioSection(key: sectionKeys.about, isDesktop: false),
          kGap80,
          SkillsSection(
            key: sectionKeys.skills,
            isDesktop: false,
          ).addPadding(padding: .symmetric(horizontal: kAppPadding)),
          kGap80,
          ProjectsSection(key: sectionKeys.projects, isDesktop: false),
          kGap90,
          ContactMeSection(
            key: sectionKeys.contact,
            isDesktop: false,
          ).addPadding(padding: .symmetric(horizontal: kAppPadding)),
          kGap100,
          Footer(isDesktop: false),
        ],
      ),
    );
  }
}
