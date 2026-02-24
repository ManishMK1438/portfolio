import 'package:flutter/material.dart';
import 'package:portfolio/app_icons_icons.dart';
import 'package:portfolio/core/exports/app_exports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool leading;
  final Color? color;
  final PreferredSizeWidget? bottom;
  final double? height;
  final List<Widget>? actions;
  final Widget? leadingWidget;
  //final GlobalKey<ScaffoldState>? globalKey;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading = true,
    this.bottom,
    this.color = primaryColor,
    this.height,
    this.leadingWidget,
    // this.globalKey,
    this.actions,
  });
  ButtonStyle _buttonStyle({
    required BuildContext context,
    // required String path,
  }) {
    return TextButton.styleFrom(
      // Check our helper to decide the color
      backgroundColor:
          Colors.transparent, // Explicitly set transparent if not active
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      // MOBILE: Shows the Drawer Menu Icon
      mobile: AppBar(
        backgroundColor: lightScaffoldColor,
        title: Text(title, style: context.textTheme.titleMedium),
        // Flutter automatically shows the drawer icon if a Scaffold has a drawer
        leading: Builder(
          builder: (newContext) => IconButton(
            icon: const Icon(Icons.menu, color: kWhite),
            onPressed: () => Scaffold.of(newContext).openDrawer(),
          ),
        ),
        actions: [
          SizedBox(
            width: 100,
            child: PrimaryButton(text: AppStrings.downloadCV, onTap: () {}),
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
                  onPressed: () {
                    //context.goNamed(AppRouteName.home);
                  },
                  style: _buttonStyle(context: context),
                  child: Text(
                    AppStrings.home,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: descriptionTextColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    AppIcons.theme,
                    size: 18,
                    color: descriptionTextColor,
                  ),
                ),
                kGap10,
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
