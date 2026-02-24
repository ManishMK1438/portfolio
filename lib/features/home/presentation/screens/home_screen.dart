import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/features/home/home_exports.dart';

//to keep the scroll position while resizing
final PageStorageBucket _homeBucket = PageStorageBucket();
const scrollKey = PageStorageKey('home_scroll');

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.portfolio),
      body: PageStorage(
        bucket: _homeBucket,
        child: ResponsiveLayout(
          mobile: HomeScreenMobile(key: scrollKey),
          web: HomeScreenWeb(key: scrollKey),
          tablet: HomeScreenTab(key: scrollKey),
        ),
      ),
    );
  }
}
