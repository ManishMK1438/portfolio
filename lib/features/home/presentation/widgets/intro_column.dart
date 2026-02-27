import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/features/home/home_exports.dart';

class IntroColumn extends StatelessWidget {
  final bool isDesktop;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;
  const IntroColumn({
    super.key,
    this.isDesktop = true,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  Widget _available(BuildContext context) => Chip(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
      side: BorderSide(color: primaryColor.withValues(alpha: 0.1)),
    ),
    padding: .symmetric(vertical: 4, horizontal: 12),
    label: Row(
      mainAxisSize: .min,
      children: [
        Icon(Icons.circle, size: 8, color: primaryColor),
        kGap5,
        Text(
          AppStrings.availableForProjects,
          style: context.textTheme.bodyMedium?.copyWith(color: primaryColor),
        ),
      ],
    ),
    backgroundColor: primaryColor.withValues(alpha: 0.05),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isDesktop ? .start : .center,
      children: [
        _available(context),
        kGap30,
        Text.rich(
          textAlign: isDesktop ? .start : .center,
          TextSpan(
            children: [
              TextSpan(
                text: "${AppStrings.senior} ",
                style: context.textTheme.headlineLarge?.copyWith(fontSize: 60),
              ),
              TextSpan(
                text: " ${AppStrings.flutter} \n",
                style: context.textTheme.headlineLarge?.copyWith(
                  fontSize: 60,
                  color: primaryLightColor,
                ),
              ),
              TextSpan(
                text: AppStrings.developer,
                style: context.textTheme.headlineLarge?.copyWith(fontSize: 60),
              ),
            ],
          ),
        ),
        kGap25,
        Text(
          AppStrings.introDescription,
          textAlign: isDesktop ? .start : .center,
          style: context.textTheme.titleMedium?.copyWith(
            color: descriptionTextColor,
            fontWeight: .normal,
          ),
        ),
        kGap25,
        Row(
          mainAxisAlignment: isDesktop ? .start : .center,
          children: [
            PrimaryButton(text: AppStrings.contactMe, onTap: onContactTap),
            kGap10,
            SecondaryButton(
              text: AppStrings.viewProjects,
              onTap: onProjectsTap,
            ),
          ],
        ),
        kGap10,
        SocialButtons(mainAxisAlignment: isDesktop ? .start : .center),
      ],
    );
  }
}
