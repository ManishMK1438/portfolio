import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      constraints: BoxConstraints(minHeight: 200),
      color: primaryColor,
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
                      color: kWhite.withValues(alpha: 0.6),
                      fontSize: 14,
                      fontWeight: .w200,
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
                  color: kWhite.withValues(alpha: 0.6),
                  fontSize: 14,
                  fontWeight: .w200,
                ),
              ),

              Text(
                AppStrings.buildWith,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: kWhite.withValues(alpha: 0.6),
                  fontSize: 14,
                  fontWeight: .w200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
