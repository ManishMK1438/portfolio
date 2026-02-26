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
        Container(
          padding: .all(6),
          decoration: BoxDecoration(
            borderRadius: .circular(8),
            color: Colors.white24,
          ),
          child: FaIcon(icon, color: Colors.white, size: 18),
        ),
        kGap20,
        Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          mainAxisSize: .min,

          children: [
            Text(
              text,
              style: context.textTheme.titleSmall?.copyWith(
                color: Colors.white,
              ),
            ),
            Text(
              data,
              style: context.textTheme.bodySmall?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          padding: .all(48),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: .circular(24),
          ),
          child: Row(
            mainAxisAlignment: .start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      AppStrings.letsBuildTogether,
                      style: context.textTheme.headlineMedium?.copyWith(
                        fontWeight: .bold,
                        color: Colors.white,
                      ),
                    ),
                    kGap25,
                    Text(
                      AppStrings.getInTouchSummary,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                    kGap30,
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
                                style: context.textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              kGap20,
                              _contactWidget(
                                icon: FontAwesomeIcons.envelope,
                                text: AppStrings.email,
                                data: AppStrings.emailData,
                                context: context,
                              ),
                              kGap10,
                              _contactWidget(
                                icon: FontAwesomeIcons.phone,
                                text: AppStrings.phone,
                                data: AppStrings.phoneData,
                                context: context,
                              ),
                              kGap10,
                              _contactWidget(
                                icon: FontAwesomeIcons.locationArrow,
                                text: AppStrings.location,
                                data: AppStrings.locationData,
                                context: context,
                              ),
                              kGap30,
                              SocialButtons(
                                mainAxisAlignment: .start,
                                isContact: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              kGap30,
              Expanded(child: ContactCard()),
            ],
          ),
        ),
        Positioned(
          bottom: -50,
          left: -100,
          child: SizedBox(
            width: 500,
            height: 500,
          ).addShadow(color: Colors.white10, shape: .circle),
        ),
        Positioned(
          top: -50,
          right: -100,
          child: SizedBox(
            width: 500,
            height: 500,
          ).addShadow(color: Colors.white10, shape: .circle),
        ),
      ],
    );
  }
}
