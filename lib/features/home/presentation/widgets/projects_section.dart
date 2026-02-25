import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/features/home/data/datasource/datasource.dart';
import 'package:portfolio/features/home/home_exports.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  Widget _projectWidget({
    required ProjectsEntity project,
    required BuildContext context,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: .all(.circular(kBorderRadius16)),
        side: BorderSide(color: primaryColor.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Expanded(child: Image.asset(project.image)),
          kGap40,
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .spaceBetween,
              mainAxisSize: .min,
              children: [
                Text(project.title, style: context.textTheme.titleLarge),
                kGap20,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    project.description,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: descriptionTextColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                kGap20,
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: project.technologies.map((technology) {
                    return AppChip(label: technology);
                  }).toList(),
                ),
                kGap20,
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    if (project.playStore.isNotEmpty)
                      PrimaryButton.icon(
                        text: "Play store",
                        icon: FontAwesomeIcons.googlePlay,
                        onTap: () {},
                      ),
                    if (project.appStore.isNotEmpty)
                      SecondaryButton.icon(
                        text: "App store",
                        icon: FontAwesomeIcons.appStore,
                        onTap: () {},
                      ),
                  ],
                ),
              ],
            ).addPadding(padding: .all(kAppPadding)),
          ),
        ],
      ).addPadding(padding: .all(25)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: kWebPadding, vertical: 80),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Text(AppStrings.projects, style: context.textTheme.headlineMedium),
          kGap15,
          Text(
            AppStrings.projectsSummary,
            style: context.textTheme.titleMedium?.copyWith(
              color: descriptionTextColor,
              fontWeight: .w400,
            ),
          ),
          kGap30,
          UniversalListView<ProjectsEntity>.separated(
            separatorBuilder: (context, item, index) => kGap20,
            shrinkWrap: true,
            items: projectsData,
            itemBuilder: (context, item, index) =>
                _projectWidget(project: item, context: context),
          ),
        ],
      ),
    );
  }
}
