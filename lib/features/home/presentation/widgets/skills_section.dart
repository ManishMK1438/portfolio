import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/features/home/data/datasource/datasource.dart';
import 'package:portfolio/features/home/home_exports.dart';

class SkillsSection extends StatelessWidget {
  final bool isDesktop;
  const SkillsSection({super.key, this.isDesktop = true});

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
            Container(
              padding: .all(10),
              decoration: BoxDecoration(
                borderRadius: .all(.circular(8)),
                color: skill.color.withValues(alpha: 0.1),
              ),

              child: Icon(skill.icon, size: 18, color: skill.color),
            ),
            kGap20,
            Text(skill.title, style: Theme.of(context).textTheme.titleMedium),
            kGap15,

            // --- SKILLS WRAP ---
            Wrap(
              spacing: 10.0, // Horizontal space between chips
              runSpacing: 10.0, // Vertical space between lines
              children: skill.skills.map((skill) {
                return AppChip(label: skill);
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
      crossAxisAlignment: .center,
      mainAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        Text(
          AppStrings.technicalProficiency,
          style: context.textTheme.headlineMedium,
        ),
        kGap10,
        Text(
          AppStrings.skillsSummary,
          textAlign: isDesktop ? .start : .center,
          style: context.textTheme.titleMedium?.copyWith(
            color: descriptionTextColor,
            fontWeight: .w200,
          ),
        ),
        kGap60,
        isDesktop
            ? UniversalGridView<SkillsEntity>.dynamic(
                crossAxisCount: 4,
                items: skillsList,
                itemBuilder: (context, item, index) =>
                    _skillsWidget(skill: item, context: context),
              )
            : UniversalListView<SkillsEntity>.separated(
                padding: .all(0),
                separatorBuilder: (context, item, index) => kGap20,
                shrinkWrap: true,
                items: skillsList,
                itemBuilder: (context, item, index) =>
                    _skillsWidget(skill: item, context: context),
              ),
      ],
    );
  }
}
