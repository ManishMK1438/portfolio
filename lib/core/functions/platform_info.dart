import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/constants.dart';

class PlatformInfo {
  PlatformInfo._();

  // 1. Static Platform Detection (Web-safe)
  static bool get isWeb => kIsWeb;

  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;

  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;

  static bool get isMobileApp => !kIsWeb && (isAndroid || isIOS);

  // 2. Responsive Breakpoints
  // Using .sizeOf(context) is 2026 best practice for performance
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < kTabletBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= kTabletBreakpoint &&
      MediaQuery.sizeOf(context).width < kWebBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= kWebBreakpoint;

  static bool isLandscape(BuildContext context) =>
      MediaQuery.orientationOf(context) == Orientation.landscape;

  // 3. Helper for Web-Mobile (Chrome on phone)
  static bool get isWebMobile => kIsWeb && (isAndroid || isIOS);

  // 4. Input Method Detection
  // Checks if the system uses "touchSlop" (distance a finger must move to scroll)
  static bool hasTouch(BuildContext context) =>
      MediaQuery.gestureSettingsOf(context).touchSlop! > 0;

  static bool get isDesktopStyle {
    if (kIsWeb) return true;
    return defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.linux;
  }
}
