import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .symmetric(horizontal: kWebPadding, vertical: 50),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: .spaceAround,
        crossAxisAlignment: .end,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Logo(),
              kGap10,
              SizedBox(
                width: context.width / 3,
                child: Flexible(
                  child: Text(
                    AppStrings.footerText,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: .w200,
                      color: descriptionTextColor.withValues(alpha: 0.8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: .end,
            children: [
              Text(
                AppStrings.copyright,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: .w200,
                  color: descriptionTextColor.withValues(alpha: 0.8),
                ),
              ),

              Text(
                AppStrings.buildWith,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: .w200,
                  color: descriptionTextColor.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
