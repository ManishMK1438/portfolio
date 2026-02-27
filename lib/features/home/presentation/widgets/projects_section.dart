import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/features/home/data/datasource/datasource.dart';
import 'package:portfolio/features/home/home_exports.dart';

class ProjectsSection extends StatelessWidget {
  final bool isDesktop;
  const ProjectsSection({super.key, this.isDesktop = true});

  Widget _buildLayout({
    required int index,
    required Widget imageSection,
    required Widget detailsSection,
  }) {
    if (isDesktop) {
      return Row(
        // 3. Conditionally arrange the children based on the index
        children: index.isOdd
            ? [
                Expanded(child: imageSection),
                kGap40,
                Expanded(child: detailsSection),
              ]
            : [
                Expanded(child: detailsSection),
                kGap40,
                Expanded(child: imageSection),
              ],
      ).addPadding(padding: .all(25));
    } else {
      return Column(children: [imageSection, kGap40, detailsSection]);
    }
  }

  Widget _projectWidget({
    required ProjectsEntity project,
    required BuildContext context,
    required int index,
  }) {
    // 1. Extract the Image into its own variable
    final imageSection = ClipRRect(
      borderRadius: .circular(kBorderRadius16),
      clipBehavior: .hardEdge,
      child: Image.asset(
        project.image,
        fit: BoxFit.cover,
        cacheWidth: 800,
        errorBuilder: (context, obj, stack) =>
            Image.asset(AppImages.noImage, fit: BoxFit.cover, cacheWidth: 800),
      ),
    );

    // 2. Extract the Details Column into its own variable
    final detailsSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (project.playStore.isNotEmpty)
              PrimaryButton.icon(
                text: "Play store",
                icon: FontAwesomeIcons.googlePlay,
                onTap: () => HelperFunctions.launchWebUrl(project.playStore),
              ),
            if (project.appStore.isNotEmpty)
              SecondaryButton.icon(
                text: "App store",
                icon: FontAwesomeIcons.appStore,
                onTap: () => HelperFunctions.launchWebUrl(project.appStore),
              ),
          ],
        ),
      ],
    ).addPadding(padding: .all(kAppPadding));

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: .all(.circular(kBorderRadius16)),
        side: BorderSide(color: primaryColor.withValues(alpha: 0.2)),
      ),
      child: _buildLayout(
        index: index,
        imageSection: imageSection,
        detailsSection: detailsSection,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(
        horizontal: isDesktop ? kWebPadding : kAppPadding,
        vertical: 80,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Text(
            AppStrings.featuredProjects,
            style: context.textTheme.headlineMedium,
          ),
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
            padding: .all(0),
            separatorBuilder: (context, item, index) => kGap20,
            shrinkWrap: true,
            items: projectsData,
            itemBuilder: (context, item, index) =>
                _projectWidget(project: item, context: context, index: index),
          ),
        ],
      ),
    );
  }
}
