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
          kGap100,
          Row(
            children: [
              Flexible(child: IntroColumn()),
              Flexible(
                child: Center(
                  child: Image.asset(AppImages.introImage).addShadow(),
                ),
              ),
            ],
          ).addPadding(padding: .symmetric(horizontal: kWebPadding)),
          kGap100,
          BioSection(),
          kGap80,
          SkillsSection().addPadding(
            padding: .symmetric(horizontal: kWebPadding),
          ),
          kGap80,
          ProjectsSection(),
          kGap60,
          ContactMeSection().addPadding(padding: .all(30)),
          kGap60,
          Footer(),
        ],
      ),
    );
  }
}
