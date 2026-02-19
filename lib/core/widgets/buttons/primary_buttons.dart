import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final IconData? icon;
  final bool isIconTrailing; // New property
  final ButtonStyle? buttonStyle;

  // Private constructor
  const PrimaryButton._({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.isIconTrailing = false,
    this.buttonStyle,
  });

  // Factory for standard button (No Icon)
  factory PrimaryButton({
    required String text,
    required VoidCallback onTap,
    ButtonStyle? buttonStyle,
  }) {
    return PrimaryButton._(text: text, onTap: onTap, buttonStyle: buttonStyle);
  }

  // Factory for button with Icon (Customizable Position)
  factory PrimaryButton.icon({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
    bool isIconTrailing = false, // Defaults to front
    ButtonStyle? buttonStyle,
  }) {
    return PrimaryButton._(
      text: text,
      icon: icon,
      onTap: onTap,
      isIconTrailing: isIconTrailing,
      buttonStyle: buttonStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: buttonStyle,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. Show icon in front if trailing is false
          if (icon != null && !isIconTrailing) ...[
            Icon(icon, size: 20),
            const SizedBox(width: 8),
          ],

          Text(text),

          // 2. Show icon in back if trailing is true
          if (icon != null && isIconTrailing) ...[
            const SizedBox(width: 8),
            Icon(icon, size: 20),
          ],
        ],
      ),
    );
  }
}
