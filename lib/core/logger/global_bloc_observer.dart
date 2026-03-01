import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/exports/packages_export.dart'
    show BlocBase, BlocObserver, Change;

class GlobalBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    // This will print every error that occurs inside any BLoC/Cubit
    AppLogger.logError(bloc.runtimeType.toString(), error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // Optional: Log state transitions to see the error state being emitted
    if (change.nextState.toString().contains('failure')) {
      AppLogger.logInfo('State Failure in ${bloc.runtimeType}');
    }
  }
}
