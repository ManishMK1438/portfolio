import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/exports/packages_export.dart';
import 'package:portfolio/features/home/home_exports.dart';

class ContactMeSection extends StatelessWidget {
  const ContactMeSection({super.key});

  Widget _contactWidget({
    required IconData icon,
    required String text,
    required String data,
    required BuildContext context,
  }) {
    return Row(
      crossAxisAlignment: .start,
      mainAxisAlignment: .start,
      children: [
        FaIcon(icon, color: primaryColor),
        kGap20,
        Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            Text(text, style: context.textTheme.titleSmall),
            Text(data, style: context.textTheme.bodySmall),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      children: [
        Text(AppStrings.getInTouch, style: context.textTheme.headlineMedium),
        kGap10,
        Text(AppStrings.getInTouchSummary, style: context.textTheme.bodyMedium),
        kGap50,
        Row(
          crossAxisAlignment: .start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .start,
                children: [
                  Text(
                    AppStrings.contactInfo,
                    style: context.textTheme.titleMedium,
                  ),
                  kGap10,
                  Text(
                    AppStrings.contactInfoSummary,
                    style: context.textTheme.bodyMedium,
                  ),
                  kGap40,
                  _contactWidget(
                    icon: FontAwesomeIcons.envelope,
                    text: AppStrings.email,
                    data: AppStrings.emailData,
                    context: context,
                  ),
                  kGap20,
                  _contactWidget(
                    icon: FontAwesomeIcons.phone,
                    text: AppStrings.phone,
                    data: AppStrings.phoneData,
                    context: context,
                  ),
                  kGap20,
                  _contactWidget(
                    icon: FontAwesomeIcons.locationArrow,
                    text: AppStrings.location,
                    data: AppStrings.locationData,
                    context: context,
                  ),
                  kGap20,
                  SocialButtons(mainAxisAlignment: .start),
                ],
              ),
            ),

            Expanded(flex: 3, child: ContactCard()),
          ],
        ),
      ],
    );
  }
}
