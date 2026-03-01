import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/exports/packages_export.dart';

class BioShimmer extends StatelessWidget {
  final bool isDesktop;
  const BioShimmer({super.key, this.isDesktop = true});

  @override
  Widget build(BuildContext context) {
    // Standardizing the base and highlight colors for a subtle look
    final baseColor = Colors.grey[300]!;
    final highlightColor = Colors.grey[100]!;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: kWebPadding,
          vertical: 80,
        ),
        color: Colors.white,
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _imagePlaceholder()),
                  kGap50,
                  Expanded(child: _textPlaceholder()),
                ],
              )
            : Column(
                children: [_textPlaceholder(), kGap50, _imagePlaceholder()],
              ),
      ),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  Widget _textPlaceholder() {
    return Column(
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        // Title placeholder
        Container(height: 40, width: 200, color: Colors.white),
        kGap25,
        // Summary line 1
        Container(height: 15, width: double.infinity, color: Colors.white),
        const SizedBox(height: 8),
        // Summary line 2
        Container(height: 15, width: double.infinity, color: Colors.white),
        const SizedBox(height: 8),
        // Summary line 3 (shorter)
        Container(height: 15, width: 150, color: Colors.white),
      ],
    );
  }
}
