import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/exports/packages_export.dart';
import 'package:portfolio/features/home/data/datasource/datasource.dart';
import 'package:portfolio/features/home/home_exports.dart';

class BioSection extends StatelessWidget {
  const BioSection({super.key});

  Widget _experienceWidget({
    required ExperienceEntity experience,
    required BuildContext context,
  }) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: primaryLightColor),
          borderRadius: .all(.circular(kBorderRadius16)),
        ),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .spaceEvenly,
          mainAxisSize: .min,
          children: [
            Row(
              mainAxisAlignment: .start,
              children: [
                FaIcon(
                  experience.heading == AppStrings.education
                      ? FontAwesomeIcons.graduationCap
                      : FontAwesomeIcons.suitcase,
                ),
                kGap10,
                Text(
                  experience.heading,
                  style: context.textTheme.headlineSmall,
                ),
              ],
            ),
            // kGap10,
            Text(experience.title, style: context.textTheme.titleSmall),
            //kGap10,
            Text(
              experience.company,
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
              ),
            ),
            // kGap10,
            Text(
              experience.duration,
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
              ),
            ),
            // kGap10,
            Text(
              experience.location,
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
              ),
            ),
          ],
        ).addPadding(padding: .all(kAppPadding)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        Text(AppStrings.aboutMe, style: context.textTheme.headlineMedium),
        kGap10,
        Text(AppStrings.bioSummary, style: context.textTheme.bodyMedium),
        kGap30,
        Row(
          children: [
            FaIcon(FontAwesomeIcons.clockRotateLeft),
            kGap10,
            Text(AppStrings.background, style: context.textTheme.headlineSmall),
          ],
        ),
        kGap30,
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 250),
          child: UniversalListView<ExperienceEntity>.separated(
            padding: .all(0),
            scrollDirection: Axis.horizontal,
            items: experienceData,
            itemBuilder: (context, item, index) =>
                _experienceWidget(experience: item, context: context),
            separatorBuilder: (context, item, index) => kGap30,
          ),
        ),
      ],
    );
  }
}
