import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';

extension UtilsGetter on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  Size get totalSize => MediaQuery.sizeOf(this);

  double get height => MediaQuery.sizeOf(this).height;

  double get width => MediaQuery.sizeOf(this).width;

  double get bottomPadding => MediaQuery.of(this).viewInsets.bottom;
}

extension StringNullableExt on String? {
  /// Returns true if the string is either null or contains only whitespace/is empty.
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;

  /// Returns the string if it has content, otherwise returns a fallback value.
  String orFallback(String fallback) {
    return isNullOrEmpty ? fallback : this!;
  }
}

extension TextExtension on Text {
  Widget textScale({double? width, BoxFit? fit, AlignmentGeometry? alignment}) {
    return SizedBox(
      width: width ?? double.infinity,
      child: FittedBox(
        alignment: alignment ?? .centerLeft,
        fit: fit ?? BoxFit.scaleDown,
        child: this,
      ),
    );
  }
}

extension ButtonExtension on PrimaryButton {
  Widget expand() {
    return Row(children: [Expanded(child: this)]);
  }
}

extension WidgetExtensions on Widget {
  Widget addPadding({EdgeInsets? padding}) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(kAppPadding),
      child: this,
    );
  }

  Widget addTopMargin({double? margin}) {
    return Container(
      margin: EdgeInsets.only(top: margin ?? 70),
      child: this,
    );
  }

  Widget addShadow({
    Color? color,
    double? blurRadius,
    double? spreadRadius,
    Offset? offset,
    BoxShape? shape,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: color ?? Colors.black.withValues(alpha: 0.15),
            spreadRadius:
                spreadRadius ??
                -5, // Shrinks the shadow to prevent top/left bleeding
            blurRadius: blurRadius ?? 20, // Softens the shadow
            offset:
                offset ??
                const Offset(20, 20), // Pushes the shadow RIGHT and DOWN
          ),
        ],
      ),
      child: this,
    );
  }

  Widget drawerDecoration({required BuildContext context}) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(kAppPadding),
        width: context.width / 2.5,
        child: this,
      ),
    );
  }
}
