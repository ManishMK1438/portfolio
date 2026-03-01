import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/exports/packages_export.dart';

import 'features/home/home_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load the hidden environment variables
  await dotenv.load(fileName: ".env");

  // Initialize Supabase securely
  await Supabase.initialize(
    url: dotenv.env[ENVStrings.supabaseUrl]!,
    anonKey: dotenv.env[ENVStrings.supabaseAnonKey]!,
  );
  // Set the global observer
  Bloc.observer = GlobalBlocObserver();

  // Catch all Flutter framework errors (e.g., UI overflows)
  FlutterError.onError = (details) {
    AppLogger.logError('FlutterFramework', details.exception, details.stack);
  };

  // Catch asynchronous errors (e.g., unhandled Future errors)
  PlatformDispatcher.instance.onError = (error, stack) {
    AppLogger.logError('AsynchronousTask', error, stack);
    return true;
  };

  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          // Use serviceLocator to get the factory-registered BLoC
          create: (context) => serviceLocator<ProfileBloc>()
            ..add(
              const GetFullProfileEvent(),
            ), // Trigger initial fetch immediately
        ),
      ],
      child: MaterialApp(
        title: 'Portfolio',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme(context),
        home: const HomeScreen(),
      ),
    );
  }
}
