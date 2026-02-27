import 'package:flutter/cupertino.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/exports/packages_export.dart';

class HelperFunctions {
  HelperFunctions._();

  // --- THE LAUNCH HELPERS ---

  // For Web Links (LinkedIn, GitHub, Instagram)
  static Future<void> launchWebUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    // externalApplication mode is the magic that opens native apps if installed!
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  // For Email (Triggers the default mail app with the "To" field filled)
  static Future<void> launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: UrlDetails.emailAddress,
      // Optional: You can even pre-fill the subject line!
      // query: 'subject=Portfolio Inquiry',
    );

    if (!await launchUrl(emailLaunchUri)) {
      debugPrint('Could not launch email client');
    }
  }
}
