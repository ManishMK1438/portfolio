import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';

class Logo extends StatelessWidget {
  final String? image;
  final double? scale;
  final Color? color;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const Logo({
    super.key,
    this.image,
    this.scale,
    this.color,
    this.height,
    this.width,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image ?? AppImages.logo,
      scale: scale ?? 8,
      color: color ?? primaryColor,
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
    );
  }
}
