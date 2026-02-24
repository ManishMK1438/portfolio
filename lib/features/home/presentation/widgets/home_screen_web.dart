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
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          spreadRadius:
                              -5, // Shrinks the shadow to prevent top/left bleeding
                          blurRadius: 20, // Softens the shadow
                          offset: const Offset(
                            20,
                            20,
                          ), // Pushes the shadow RIGHT and DOWN
                        ),
                      ],
                      /* image: DecorationImage(
                        image: AssetImage(AppImages.introImage),
                      ),*/
                    ),
                    child: Image.asset(AppImages.introImage),
                  ),
                ),
              ),
            ],
          ).addPadding(padding: .symmetric(horizontal: kWebPadding)),
          kGap100,
          BioSection().addPadding(padding: .all(kWebPadding)),
          kGap60,
          ProjectsSection().addPadding(padding: .all(30)),
          kGap60,
          SkillsSection().addPadding(padding: .all(30)),
          kGap60,
          ContactMeSection().addPadding(padding: .all(30)),
          kGap60,
          Footer(),
        ],
      ),
    );
  }
}
