import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final IconData? icon;
  final bool isIconTrailing;
  final ButtonStyle? buttonStyle;

  const SecondaryButton._({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.isIconTrailing = false,
    this.buttonStyle,
  });

  factory SecondaryButton({
    required String text,
    required VoidCallback onTap,
    ButtonStyle? buttonStyle,
  }) {
    return SecondaryButton._(
      text: text,
      onTap: onTap,
      buttonStyle: buttonStyle,
    );
  }

  factory SecondaryButton.icon({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
    bool isIconTrailing = false,
    ButtonStyle? buttonStyle,
  }) {
    return SecondaryButton._(
      text: text,
      icon: icon,
      onTap: onTap,
      isIconTrailing: isIconTrailing,
      buttonStyle: buttonStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: buttonStyle,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null && !isIconTrailing) ...[
            FaIcon(icon, size: 20),
            const SizedBox(width: 8),
          ],
          Text(text),
          if (icon != null && isIconTrailing) ...[
            const SizedBox(width: 8),
            Icon(icon, size: 20),
          ],
        ],
      ),
    );
  }
}
