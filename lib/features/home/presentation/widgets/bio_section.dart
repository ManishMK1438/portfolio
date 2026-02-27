import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';

class BioSection extends StatelessWidget {
  const BioSection({super.key, this.isDesktop = true});

  final bool isDesktop;

  Widget _image() {
    return Align(
      alignment: isDesktop
          ? .centerLeft
          : .center, // Keeps the image on the left side
      child:
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              AppImages.resume1,
              height: 500,
              cacheWidth: 800,
              // 2. Change to 'cover' to ensure the image perfectly fills the shadow box bounds
              fit: BoxFit.cover,
            ),
          ).addShadow(
            color: primaryColor.withValues(alpha: 0.2),
            blurRadius: 400,
            spreadRadius: 50,
            offset: const Offset(0, 0),
          ),
    );
  }

  Widget _text(BuildContext context) {
    return Column(
      crossAxisAlignment: isDesktop ? .start : .center,
      children: [
        Text(
          AppStrings.bio,
          textAlign: isDesktop ? .start : .center,
          style: context.textTheme.headlineLarge?.copyWith(fontSize: 36),
        ),
        kGap25,
        Text(
          AppStrings.bioSummary,
          style: context.textTheme.bodyMedium?.copyWith(
            color: descriptionTextColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: .symmetric(horizontal: kWebPadding, vertical: 80),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          isDesktop
              ? Row(
                  children: [
                    Expanded(child: _image()),
                    kGap50,
                    Expanded(child: _text(context)),
                  ],
                )
              : Column(children: [_text(context), kGap50, _image()]),
        ],
      ),
    );
  }
}
