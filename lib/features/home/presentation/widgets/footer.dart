import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';

class Footer extends StatelessWidget {
  final bool isDesktop;
  const Footer({super.key, this.isDesktop = true});

  Widget _layoutBuilder(BuildContext context) {
    final widget1 = Column(
      crossAxisAlignment: isDesktop ? .start : .center,
      children: [
        Logo(),
        kGap10,
        SizedBox(
          width: isDesktop ? context.width / 3 : context.width,
          child: Text(
            AppStrings.footerText,
            textAlign: isDesktop ? .start : .center,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              fontWeight: .w200,
              color: descriptionTextColor.withValues(alpha: 0.8),
            ),
          ),
        ),
      ],
    );
    final widget2 = Column(
      crossAxisAlignment: isDesktop ? .end : .center,
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
    );
    if (isDesktop) {
      return Row(
        mainAxisAlignment: .spaceAround,
        crossAxisAlignment: .end,
        children: [widget1, widget2],
      );
    } else {
      return Column(
        crossAxisAlignment: .stretch,
        children: [widget1, kGap20, widget2],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .symmetric(horizontal: kWebPadding, vertical: 50),
      color: Colors.white,
      child: _layoutBuilder(context),
    );
  }
}
