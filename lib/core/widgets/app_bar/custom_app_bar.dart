import 'package:flutter/material.dart';
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
  /*
  ButtonStyle _buttonStyle({
    required BuildContext context,
    required String path,
  }) {
    return TextButton.styleFrom(
      // Check our helper to decide the color
      backgroundColor: HelperFunctions.isRouteActive(context, path)
          ? textButtonOverlayColor
          : Colors.transparent, // Explicitly set transparent if not active
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      // MOBILE: Shows the Drawer Menu Icon
      mobile: AppBar(
        backgroundColor: primaryColor,
        title: Text(title, style: TextStyle(color: kWhite)),
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
        color: primaryColor,
        width: double.infinity,
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Logo(scale: 15),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    //context.goNamed(AppRouteName.home);
                  },
                  /*style: _buttonStyle(
                    context: context,
                    path: AppRoutePath.home,
                  ),*/
                  child: Text(
                    AppStrings.home,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: kWhite,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              width: 100,
              child: PrimaryButton(
                text: AppStrings.downloadCV,
                onTap: () {},
                buttonStyle: ElevatedButton.styleFrom(
                  foregroundColor: lightButtonBackgroundColor,
                  backgroundColor: lightButtonForegroundColor,
                  textStyle: context.textTheme.bodySmall,
                  padding: .symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      /*AppBar(
        leadingWidth: 100, // Give space for the branding image
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: const FlutterLogo(),
        ),
        title: Text(title),
        automaticallyImplyLeading:
            false, // Prevents the drawer icon from appearing
      ),*/
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
