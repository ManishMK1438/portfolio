import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';

class AppChip extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;
  const AppChip({super.key, required this.label, this.labelStyle});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: descriptionTextColor.withValues(alpha: 0.05),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: primaryLightColor, width: 1),
        borderRadius: .all(.circular(4)),
      ),
      label: Text(label),
      labelStyle: labelStyle ?? context.textTheme.bodySmall,
    );
  }
}
