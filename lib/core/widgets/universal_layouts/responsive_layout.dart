import 'package:flutter/cupertino.dart';
import 'package:portfolio/core/exports/app_exports.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget web;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.web,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= kWebBreakpoint) {
          return web;
        }
        if (constraints.maxWidth >= kTabletBreakpoint) {
          return tablet ?? mobile;
        }
        return mobile;
      },
    );
  }
}
