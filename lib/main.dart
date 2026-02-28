import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/core/exports/packages_export.dart';
import 'package:portfolio/features/home/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load the hidden environment variables
  await dotenv.load(fileName: ".env");

  // Initialize Supabase securely
  await Supabase.initialize(
    url: dotenv.env[ENVStrings.supabaseUrl]!,
    anonKey: dotenv.env[ENVStrings.supabaseAnonKey]!,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme(context),
      home: const HomeScreen(),
    );
  }
}
