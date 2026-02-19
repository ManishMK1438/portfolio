import 'package:flutter/material.dart';
import 'package:portfolio/core/functions/platform_info.dart';

class AppFontSizes {
  AppFontSizes._();

  // --- Headline Styles (For Hero sections and Page Titles) ---
  // Large: 48 (Desktop) -> 32 (Mobile)
  static double headlineLarge(BuildContext context) =>
      PlatformInfo.isDesktop(context) ? 48.0 : 32.0;

  // Medium: 32 (Desktop) -> 24 (Mobile)
  static double headlineMedium(BuildContext context) =>
      PlatformInfo.isDesktop(context) ? 32.0 : 24.0;

  static const double headlineSmall = 20.0;

  // --- Title Styles (For AppBars, Modals, and Cards) ---
  static const double titleLarge = 22.0;
  static const double titleMedium = 18.0;
  static const double titleSmall = 16.0;

  // --- Body Styles (For Paragraphs and Descriptions) ---
  // Note: Web users prefer slightly larger body text (16-18px)
  static double bodyLarge(BuildContext context) =>
      PlatformInfo.isDesktop(context) ? 18.0 : 16.0;

  static double bodyMedium(BuildContext context) =>
      PlatformInfo.isDesktop(context) ? 16.0 : 14.0;

  static const double bodySmall = 12.0;

  // --- Label Styles (For Buttons, Tabs, and Small Tags) ---
  static const double labelLarge = 14.0;
  static const double labelMedium = 12.0;
  static const double labelSmall = 10.0;

  // --- Display Styles (For Branding or Big Stats) ---
  static double displayLarge(BuildContext context) =>
      PlatformInfo.isDesktop(context) ? 64.0 : 44.0;
}
