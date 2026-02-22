import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/features/home/home_exports.dart';

class IntroColumn extends StatelessWidget {
  const IntroColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .center,
      children: [
        Text(AppStrings.heyThere, style: context.textTheme.titleMedium),
        kGap10,
        Text(AppStrings.manishKumar, style: context.textTheme.headlineLarge),
        kGap10,
        Text(
          AppStrings.seniorFlutterDeveloper,
          style: context.textTheme.bodyLarge,
        ),
        kGap10,
        Text(AppStrings.desc, style: context.textTheme.bodySmall),
        kGap10,

        Row(
          mainAxisAlignment: .center,
          children: [
            PrimaryButton(text: AppStrings.contactMe, onTap: () {}),
            kGap10,
            SecondaryButton(text: AppStrings.viewProjects, onTap: () {}),
          ],
        ),
        kGap10,
        SocialButtons(),
      ],
    );
  }
}
