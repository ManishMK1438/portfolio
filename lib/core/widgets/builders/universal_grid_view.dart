import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';

class UniversalGridView<T> extends StatelessWidget {
  final List<T> items;
  final ItemBuilder<T> itemBuilder;
  final int crossAxisCount;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final bool isInsideScrollview;
  final double? mainAxisExtent;

  const UniversalGridView({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.crossAxisSpacing = 10,
    this.mainAxisSpacing = 10,
    this.crossAxisCount = 2,
    this.childAspectRatio = 1.0,
    this.mainAxisExtent,
    this.isInsideScrollview = false,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: isInsideScrollview,
      physics: isInsideScrollview
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: mainAxisExtent,
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) =>
          itemBuilder(context, items[index], index),
    );
  }
}
