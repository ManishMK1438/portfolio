import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/exports/packages_export.dart' show Either;

typedef ItemBuilder<T> =
    Widget Function(BuildContext context, T item, int index);

typedef SeparatorBuilder<T> =
    Widget Function(BuildContext context, T item, int index);

typedef ResultFuture<T> = Future<Either<AppException, T>>;
typedef ResultVoid = ResultFuture<void>;

abstract interface class UseCase<T, Params> {
  ResultFuture<T> call(Params params);
}

class NoParams {}
