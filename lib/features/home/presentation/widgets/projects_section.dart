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
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(project.image)),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .spaceBetween,
              mainAxisSize: .min,
              children: [
                Text(project.title, style: context.textTheme.headlineSmall),

                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    project.description,
                    style: context.textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                  ),
                ),

                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: project.technologies.map((technology) {
                    return Chip(
                      backgroundColor: primaryLightColor.withValues(alpha: 0.5),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: primaryLightColor, width: 1),
                        borderRadius: .all(.circular(kBorderRadius16)),
                      ),
                      label: Text(
                        technology,
                        style: context.textTheme.labelSmall?.copyWith(
                          color: primaryColor,
                        ),
                      ),
                    );
                  }).toList(),
                ),

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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        Text(AppStrings.projects, style: context.textTheme.headlineMedium),
        kGap10,
        Text(AppStrings.projectsSummary, style: context.textTheme.bodyMedium),
        kGap30,
        UniversalGridView<ProjectsEntity>(
          isInsideScrollview: true,
          crossAxisCount: 3,
          items: projectsData,
          itemBuilder: (context, item, index) =>
              _projectWidget(project: item, context: context),
        ),
      ],
    );
  }
}
