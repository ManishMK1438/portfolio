import 'package:flutter/material.dart';

typedef ItemBuilder<T> =
    Widget Function(BuildContext context, T item, int index);

typedef SeparatorBuilder<T> =
    Widget Function(BuildContext context, T item, int index);
