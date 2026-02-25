import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/exports/packages_export.dart';

class SocialButtons extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final bool isContact;

  const SocialButtons({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.isContact = false,
  });

  // Helper method to build each button
  Widget _buildSocialIcon({
    required Widget iconWidget,
    required VoidCallback onPressed,
  }) {
    // 1. Create the base button
    /* Widget button = IconButton(
      onPressed: onPressed,
      icon: iconWidget,
      color: buttonColor,
    );*/

    Widget button = GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: iconWidget,
      ),
    );

    // 2. Conditionally wrap it in the Container
    if (isContact) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white24,
        ),
        child: button,
      );
    }

    // 3. Otherwise, just return the naked button
    return button;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        _buildSocialIcon(
          iconWidget: FaIcon(
            FontAwesomeIcons.linkedin,
            color: isContact ? Colors.white : primaryColor,
          ),
          onPressed: () {},
        ),
        kGap10,
        _buildSocialIcon(
          iconWidget: FaIcon(
            FontAwesomeIcons.github,
            color: isContact ? Colors.white : Colors.black,
          ),
          onPressed: () {},
        ),
        kGap10,
        _buildSocialIcon(
          iconWidget: FaIcon(
            FontAwesomeIcons.envelope,
            color: isContact ? Colors.white : Colors.black,
          ),
          onPressed: () {},
        ),
        kGap10,
        _buildSocialIcon(
          iconWidget: FaIcon(
            FontAwesomeIcons.instagram,
            color: isContact ? Colors.white : Colors.red.shade900,
          ),

          onPressed: () {},
        ),
      ],
    );
  }
}
