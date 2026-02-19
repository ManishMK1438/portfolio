import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/exports/packages_export.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme getTheme(BuildContext context, {required bool isLight}) {
    // Base color selection
    Color headlineColor = isLight ? lightHeadlineColor : kWhite;
    Color bodyColor = isLight ? lightBodyColor : kWhite.withValues(alpha: 0.9);
    Color titleColor = isLight ? lightTitleColor : kWhite
      ..withValues(alpha: 0.8);

    return TextTheme(
      headlineLarge: GoogleFonts.inter(
        fontSize: AppFontSizes.headlineLarge(context),
        fontWeight: FontWeight.bold,
        color: headlineColor,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: AppFontSizes.headlineMedium(context),
        fontWeight: FontWeight.w600,
        color: headlineColor,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: AppFontSizes.headlineSmall, // 20.0
        fontWeight: FontWeight.w600,
        color: headlineColor,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: AppFontSizes.titleLarge, // 22.0
        color: titleColor,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: AppFontSizes.titleMedium,
        color: titleColor,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: AppFontSizes.titleSmall,
        color: titleColor,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: AppFontSizes.bodyLarge(context),
        color: bodyColor,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: AppFontSizes.bodyMedium(context),
        color: bodyColor,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: AppFontSizes.bodySmall,
        color: bodyColor,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: AppFontSizes.labelLarge, // 14.0
        color: isLight ? lightLabelColor : whiteTextColor,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: AppFontSizes.labelMedium,
        color: isLight ? lightLabelColor : whiteTextColor,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: AppFontSizes.labelSmall,
        color: isLight ? lightLabelColor : whiteTextColor,
        fontWeight: FontWeight.bold,
      ),
      displayLarge: GoogleFonts.inter(
        fontSize: AppFontSizes.displayLarge(context),
        color: whiteTextColor,
        fontWeight: FontWeight.bold,
      ),
      // ... Repeat the pattern for other styles as needed
    );
  }
}
