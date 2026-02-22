import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';

import 'custom_themes/primary_button_theme.dart';
import 'custom_themes/text_theme.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme(BuildContext context) => ThemeData(
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primaryColor,
    ),
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: lightScaffoldColor,
    textTheme: AppTextTheme.getTheme(context, isLight: true),
    colorScheme: const ColorScheme.light(
      /* primary: kBlueGrad1,
      secondary: kBlueGrad2,
      tertiary: kBlueGrad2*/
    ),
    tabBarTheme: const TabBarThemeData(
      indicatorColor: kWhite,
      dividerColor: kWhite,
      labelColor: kWhite,
      unselectedLabelColor: kWhite,
      unselectedLabelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    ),
    // scaffoldBackgroundColor: lightScaffoldColor,
    //textTheme: AppTextTheme.lightTextTheme,
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll<Color>(kWhite),
        overlayColor: WidgetStatePropertyAll<Color>(textButtonOverlayColor),
      ),
    ),
    elevatedButtonTheme: AppButtonThemes.lightElevatedButtonTheme(context),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        side: BorderSide(color: primaryColor, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(
          vertical: PlatformInfo.isDesktopStyle ? 20.0 : kButtonPadding,
          horizontal: PlatformInfo.isDesktopStyle ? 24.0 : kButtonPadding,
        ),
        // Ensures text style matches your AppTextTheme
        textStyle: AppTextTheme.getTheme(context, isLight: true).labelLarge,
      ),
    ),
    /*appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
    ),*/
    listTileTheme: ListTileThemeData(
      tileColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.hovered)) {
          return primaryColor.withValues(alpha: 0.5); // Hover color
        }
        return Colors.transparent; // Default color
      }),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor, // Changes the blinking cursor
      selectionColor: primaryColor.withValues(
        alpha: 0.3,
      ), // Changes the highlight color when selecting text
      selectionHandleColor: primaryColor, // Changes the mobile drag handles
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
    // dividerTheme: const DividerThemeData(color: kWhite),
    /*switchTheme: const SwitchThemeData(
      trackOutlineColor: WidgetStatePropertyAll<Color>(Colors.transparent),
    ),*/
    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      // color: primaryLightColor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: kWhite),
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: AppTextTheme.getTheme(context, isLight: false),
    dialogTheme: const DialogThemeData(backgroundColor: kBlackGrad1),
    colorScheme: const ColorScheme.dark(
      primary: kBlackGrad1,
      secondary: kBlackGrad2,
      tertiary: kWhite,
      // tertiary:
    ),
    tabBarTheme: const TabBarThemeData(
      indicatorColor: kOrangeGrad1,
      dividerColor: kWhite,
    ),
    // scaffoldBackgroundColor: lightScaffoldColor,
    //textTheme: AppTextTheme.darkTextTheme,
    elevatedButtonTheme: AppButtonThemes.lightElevatedButtonTheme(context),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
    dividerTheme: const DividerThemeData(color: kWhite),
    switchTheme: const SwitchThemeData(
      trackOutlineColor: WidgetStatePropertyAll<Color>(Colors.transparent),
    ),
    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: primaryLightColor,
    ),
  );
}
