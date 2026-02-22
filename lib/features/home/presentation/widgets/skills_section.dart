import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/exports/packages_export.dart';
import 'package:portfolio/features/home/data/datasource/datasource.dart';
import 'package:portfolio/features/home/home_exports.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  Widget _skillsWidget({
    required SkillsEntity skill,
    required BuildContext context,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Prevents vertical stretching
          children: [
            // --- HEADER ---
            Row(
              children: [
                FaIcon(skill.icon, size: 24),
                kGap10,
                Text(
                  skill.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            kGap20,

            // --- SKILLS WRAP ---
            Wrap(
              spacing: 10.0, // Horizontal space between chips
              runSpacing: 10.0, // Vertical space between lines
              children: skill.skills.map((skill) {
                return Chip(
                  backgroundColor: primaryLightColor.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: primaryLightColor, width: 1),
                    borderRadius: .all(.circular(kBorderRadius16)),
                  ),
                  label: Text(skill),
                  labelStyle: context.textTheme.labelSmall?.copyWith(
                    color: primaryColor,
                  ),
                );
              }).toList(),
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
      mainAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        Text(AppStrings.skills, style: context.textTheme.headlineMedium),
        kGap10,
        Text(AppStrings.skillsSummary, style: context.textTheme.bodyMedium),
        kGap30,
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200),
          child: UniversalListView<SkillsEntity>.separated(
            padding: .all(0),
            scrollDirection: Axis.horizontal,
            items: skillsList,
            itemBuilder: (context, item, index) =>
                _skillsWidget(skill: item, context: context),
            separatorBuilder: (context, item, index) => kGap30,
          ),
        ),
      ],
    );
  }
}
