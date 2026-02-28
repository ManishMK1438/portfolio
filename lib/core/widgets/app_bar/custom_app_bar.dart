import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/features/home/presentation/screens/home_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool leading;
  final Color? color;
  final PreferredSizeWidget? bottom;
  final double? height;
  final List<Widget>? actions;
  final Widget? leadingWidget;
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;
  final PortfolioSection activeTab;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onContactTap,
    this.leading = true,
    this.bottom,
    this.color = primaryColor,
    this.height,
    this.leadingWidget,
    // this.globalKey,
    this.actions,
    required this.activeTab,
  });

  ButtonStyle _buttonStyle({
    required BuildContext context,
    required PortfolioSection section,
  }) {
    return TextButton.styleFrom(
      overlayColor: activeTab == section
          ? textButtonOverlayColor.shade300
          : Colors.transparent,
      // Check our helper to decide the color
      backgroundColor: activeTab == section
          ? textButtonOverlayColor.shade300
          : Colors.transparent, // Explicitly set transparent if not active
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      // MOBILE: Shows the Drawer Menu Icon
      mobile: AppBar(
        elevation: 0,
        backgroundColor: lightScaffoldColor,
        scrolledUnderElevation:
            0, // Disables the scroll-triggered shadow/color shift
        surfaceTintColor:
            Colors.transparent, // Removes the Material 3 color overlay
        title: Text(title, style: context.textTheme.titleMedium),
        // Flutter automatically shows the drawer icon if a Scaffold has a drawer
        leading: Builder(
          builder: (newContext) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(newContext).openDrawer(),
          ),
        ),
        actions: [
          /*IconButton(
                  onPressed: () {},
                  icon: Icon(
                    AppIcons.theme,
                    size: 18,
                    color: descriptionTextColor,
                  ),
                ),
                kGap10,*/
          SizedBox(
            width: 100,
            child: PrimaryButton(
              text: AppStrings.downloadCV,
              onTap: () {},
              buttonStyle: ElevatedButton.styleFrom(
                foregroundColor: lightButtonForegroundColor,
                backgroundColor: lightButtonBackgroundColor,
                textStyle: context.textTheme.bodySmall,
                padding: .symmetric(vertical: 16),
              ),
            ),
          ),
          kGap10,
        ],
      ),

      // WEB/TABLET: Shows an Image instead of a drawer icon
      web: Container(
        padding: .symmetric(horizontal: kAppPadding),
        color: lightScaffoldColor,
        width: double.infinity,
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Logo(scale: 15),
                kGap10,
                Text(title, style: context.textTheme.titleMedium),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: onHomeTap,
                  style: _buttonStyle(
                    context: context,
                    section: PortfolioSection.home,
                  ),
                  child: Text(
                    AppStrings.home,
                    style: _textButtonStyle(context, PortfolioSection.home),
                  ),
                ),
                TextButton(
                  onPressed: onAboutTap,
                  style: _buttonStyle(
                    context: context,
                    section: PortfolioSection.about,
                  ),
                  child: Text(
                    AppStrings.about,
                    style: _textButtonStyle(context, PortfolioSection.about),
                  ),
                ),
                TextButton(
                  onPressed: onSkillsTap,
                  style: _buttonStyle(
                    context: context,
                    section: PortfolioSection.skills,
                  ),
                  child: Text(
                    AppStrings.skills,
                    style: _textButtonStyle(context, PortfolioSection.skills),
                  ),
                ),
                TextButton(
                  onPressed: onProjectsTap,
                  style: _buttonStyle(
                    context: context,
                    section: PortfolioSection.projects,
                  ),
                  child: Text(
                    AppStrings.projects,
                    style: _textButtonStyle(context, PortfolioSection.projects),
                  ),
                ),
                TextButton(
                  onPressed: onContactTap,
                  style: _buttonStyle(
                    context: context,
                    section: PortfolioSection.contact,
                  ),
                  child: Text(
                    AppStrings.contact,
                    style: _textButtonStyle(context, PortfolioSection.contact),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                /*IconButton(
                  onPressed: () {},
                  icon: Icon(
                    AppIcons.theme,
                    size: 18,
                    color: descriptionTextColor,
                  ),
                ),
                kGap10,*/
                SizedBox(
                  width: 100,
                  child: PrimaryButton(
                    text: AppStrings.downloadCV,
                    onTap: () {},
                    buttonStyle: ElevatedButton.styleFrom(
                      foregroundColor: lightButtonForegroundColor,
                      backgroundColor: lightButtonBackgroundColor,
                      textStyle: context.textTheme.bodySmall,
                      padding: .symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
