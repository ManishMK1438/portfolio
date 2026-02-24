import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/exports/packages_export.dart';
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
    return Container(
      color: Colors.white,
      padding: .symmetric(horizontal: kWebPadding, vertical: 80),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Row(
            children: [
              Expanded(
                // 1. Align prevents the Container from stretching horizontally!
                child: Align(
                  alignment:
                      Alignment.centerLeft, // Keeps the image on the left side
                  child:
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          AppImages.resume1,
                          height: 500,
                          // 2. Change to 'cover' to ensure the image perfectly fills the shadow box bounds
                          fit: BoxFit.cover,
                        ),
                      ).addShadow(
                        color: primaryColor.withValues(alpha: 0.2),
                        blurRadius: 40,
                        spreadRadius: 5,
                        offset: const Offset(200, 0),
                      ),
                ),
              ),
              kGap50,
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      AppStrings.bio,
                      style: context.textTheme.headlineLarge?.copyWith(
                        fontSize: 36,
                      ),
                    ),
                    kGap25,
                    Text(
                      AppStrings.bioSummary,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: descriptionTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
