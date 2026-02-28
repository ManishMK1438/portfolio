import 'package:flutter/material.dart';
import 'package:portfolio/app_icons_icons.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/exports/packages_export.dart';

class HelperFunctions {
  HelperFunctions._();

  // 1. Define your strict mappings here
  static final Map<String, Color> _predefinedColors = {
    "Core Technologies": Colors.blue,
    "Architecture & State": Colors.purple,
    "Backend & API": Colors.green,
    "Firebase & Cloud": Colors.orange,
    "Media & Features": Colors.red,
    "Payments & Tools": Colors.blue.shade900, // Make sure to use shade900!
    "Soft skills": Colors.cyan,
  };

  static final Map<String, IconData> _predefinedIcons = {
    "Core Technologies": AppIcons.coreTech,
    "Architecture & State": AppIcons.architecture,
    "Backend & API": AppIcons.backend,
    "Firebase & Cloud": AppIcons.cloud,
    "Media & Features": AppIcons.media,
    "Payments & Tools": AppIcons.payment,
    "Soft skills": AppIcons.softSkills,
  };

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

  static Color generateConsistentColor(String seedText) {
    if (_predefinedColors.containsKey(seedText)) {
      return _predefinedColors[seedText]!;
    }

    final List<Color> palette = [
      Colors.blueAccent,
      Colors.teal,
      Colors.deepPurple,
      Colors.orangeAccent,
      Colors.indigo,
      Colors.cyan,
      Colors.pinkAccent,
    ];

    final int index = seedText.hashCode.abs() % palette.length;
    return palette[index];
  }

  static IconData generateConsistentIcon(String seedText) {
    if (_predefinedIcons.containsKey(seedText)) {
      return _predefinedIcons[seedText]!;
    }
    final List<IconData> icons = [
      Icons.terminal,
      Icons.data_object,
      Icons.storage,
      Icons.api,
      Icons.memory,
      Icons.cloud_queue,
      Icons.code,
      Icons.integration_instructions,
      Icons.architecture,
    ];

    final int index = seedText.hashCode.abs() % icons.length;
    return icons[index];
  }
}
