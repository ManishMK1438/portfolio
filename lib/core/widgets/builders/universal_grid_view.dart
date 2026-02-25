import 'package:flutter/material.dart';

class UniversalGridView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final int crossAxisCount;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final bool isInsideScrollview;
  final double? mainAxisExtent;

  // Private flag to determine which rendering engine to use
  final bool _isDynamic;

  // 1. Standard Default Constructor (Your Original Code)
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
  }) : _isDynamic = false;

  // 2. Factory-Style Named Constructor for Dynamic Heights
  const UniversalGridView.dynamic({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.crossAxisSpacing = 10,
    this.mainAxisSpacing = 10,
    this.crossAxisCount = 2,
  }) : _isDynamic = true,
       // Default values for standard grid properties we don't need
       childAspectRatio = 1.0,
       mainAxisExtent = null,
       // Wrap natively takes up only required space, so it behaves like shrinkWrap: true
       isInsideScrollview = true;

  @override
  Widget build(BuildContext context) {
    // --- DYNAMIC HEIGHT RENDERER ---
    if (_isDynamic) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final totalSpacing = crossAxisSpacing * (crossAxisCount - 1);
          final double itemWidth =
              (constraints.maxWidth - totalSpacing) / crossAxisCount;

          return Wrap(
            spacing: crossAxisSpacing,
            runSpacing: mainAxisSpacing,
            children: items.asMap().entries.map((entry) {
              return SizedBox(
                width: itemWidth,
                child: itemBuilder(context, entry.value, entry.key),
              );
            }).toList(),
          );
        },
      );
    }

    // --- STANDARD NATIVE RENDERER ---
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
