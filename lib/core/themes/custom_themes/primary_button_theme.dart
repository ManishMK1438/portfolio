import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/themes/custom_themes/text_theme.dart';

class AppButtonThemes {
  // 1. Private constructor to prevent instantiation
  AppButtonThemes._();

  // 2. Static getter for clean access in AppThemes
  static ElevatedButtonThemeData lightElevatedButtonTheme(
    BuildContext context,
  ) => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      // Adaptive padding based on input method (Mouse vs Touch)
      padding: EdgeInsets.symmetric(
        vertical: PlatformInfo.isDesktopStyle ? 20.0 : kButtonPadding,
        horizontal: PlatformInfo.isDesktopStyle ? 24.0 : kButtonPadding,
      ),
      foregroundColor: lightButtonForegroundColor,
      backgroundColor: lightButtonBackgroundColor,
      overlayColor: Colors.white30,
      textStyle: AppTextTheme.getTheme(context, isLight: true).labelLarge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          PlatformInfo.isDesktopStyle ? 8.0 : 12.0,
        ),
      ),
    ),
  );
}
