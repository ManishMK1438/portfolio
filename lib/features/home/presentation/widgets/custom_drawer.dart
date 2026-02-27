import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/features/home/presentation/screens/home_screen.dart'
    show PortfolioSection;

class CustomDrawer extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;
  final PortfolioSection activeTab;
  const CustomDrawer({
    super.key,
    required this.onContactTap,
    required this.activeTab,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
  });

  TextStyle? _textButtonStyle(
    BuildContext context,
    PortfolioSection selectedTab,
  ) {
    return context.textTheme.bodyMedium?.copyWith(
      // THE FIX: Conditionally change the text color!
      color: activeTab == selectedTab
          ? Colors
                .black // Or Colors.white if your background is dark
          : descriptionTextColor,
      // Optional: Make it bold when active
      fontWeight: activeTab == selectedTab
          ? FontWeight.bold
          : FontWeight.normal,
      fontSize: 14,
    );
  }

  Color _tileColor({
    required BuildContext context,
    required PortfolioSection section,
  }) {
    return activeTab == section
        ? textButtonOverlayColor.shade300
        : Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: .symmetric(horizontal: 8),
        children: [
          kGap100,
          ListTile(
            tileColor: _tileColor(
              context: context,
              section: PortfolioSection.home,
            ),
            leading: Icon(Icons.home),
            title: Text(
              AppStrings.home,
              style: _textButtonStyle(context, PortfolioSection.home),
            ),
            onTap: onHomeTap,
          ),
          ListTile(
            leading: Icon(Icons.person),
            tileColor: _tileColor(
              context: context,
              section: PortfolioSection.about,
            ),
            title: Text(
              AppStrings.about,
              style: _textButtonStyle(context, PortfolioSection.about),
            ),
            onTap: onAboutTap,
          ),
          ListTile(
            leading: Icon(Icons.work),
            tileColor: _tileColor(
              context: context,
              section: PortfolioSection.skills,
            ),
            title: Text(
              AppStrings.skills,
              style: _textButtonStyle(context, PortfolioSection.skills),
            ),
            onTap: onSkillsTap,
          ),
          ListTile(
            leading: Icon(Icons.code),
            tileColor: _tileColor(
              context: context,
              section: PortfolioSection.projects,
            ),
            title: Text(
              AppStrings.projects,
              style: _textButtonStyle(context, PortfolioSection.projects),
            ),
            onTap: onProjectsTap,
          ),
          ListTile(
            leading: Icon(Icons.phone),
            tileColor: _tileColor(
              context: context,
              section: PortfolioSection.contact,
            ),
            title: Text(
              AppStrings.contact,
              style: _textButtonStyle(context, PortfolioSection.contact),
            ),
            onTap: onContactTap,
          ),
        ],
      ),
    );
  }
}
