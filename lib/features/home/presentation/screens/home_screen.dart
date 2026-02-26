import 'package:flutter/material.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/features/home/home_exports.dart';

//to keep the scroll position while resizing
final PageStorageBucket _homeBucket = PageStorageBucket();
const scrollKey = PageStorageKey('home_scroll');

enum PortfolioSection { home, about, skills, projects, contact }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PortfolioKeys keys = PortfolioKeys();

  // 1. Replace the standard boolean with a ValueNotifier
  final ValueNotifier<bool> _showFabNotifier = ValueNotifier(false);

  final ValueNotifier<PortfolioSection> _activeTabNotifier = ValueNotifier(
    PortfolioSection.home,
  );

  void _onTabTapped(GlobalKey key, PortfolioSection section) {
    // 1. Instantly update the UI so it feels responsive
    _activeTabNotifier.value = section;

    // 2. Perform the scroll
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  // Checks if a specific widget has scrolled past a certain point on the screen
  bool _isPastThreshold(GlobalKey key, double threshold) {
    final context = key.currentContext;
    if (context == null) return false;

    final RenderBox box = context.findRenderObject() as RenderBox;
    // localToGlobal(Offset.zero) gives us the exact X/Y screen coordinates of the widget
    final position = box.localToGlobal(Offset.zero);

    return position.dy <= threshold;
  }

  // Updates the notifier based on scroll position
  void _updateActiveTabOnScroll() {
    // We consider a section "active" when it reaches the top 1/3rd of the screen
    final double screenThreshold = MediaQuery.of(context).size.height / 3;

    PortfolioSection newSection = PortfolioSection.home;

    // Check from bottom to top!
    if (_isPastThreshold(keys.contact, screenThreshold)) {
      newSection = PortfolioSection.contact;
    } else if (_isPastThreshold(keys.projects, screenThreshold)) {
      newSection = PortfolioSection.projects;
    } else if (_isPastThreshold(keys.skills, screenThreshold)) {
      newSection = PortfolioSection.skills;
    } else if (_isPastThreshold(keys.about, screenThreshold)) {
      newSection = PortfolioSection.about;
    }

    // Only update if the section actually changed to avoid unnecessary notifier triggers
    if (_activeTabNotifier.value != newSection) {
      _activeTabNotifier.value = newSection;
    }
  }

  @override
  void dispose() {
    _showFabNotifier.dispose();
    _activeTabNotifier.dispose(); // Don't forget to dispose!
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // // Preloads the image into the cache immediately
    // precacheImage(const AssetImage(AppImages.resume1), context);
    // precacheImage(const AssetImage(AppImages.introImage), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ValueListenableBuilder<PortfolioSection>(
          valueListenable: _activeTabNotifier,
          builder: (context, activeTab, child) {
            return CustomAppBar(
              title: AppStrings.portfolio,
              activeTab:
                  activeTab, // Pass the active tab to your CustomAppBar widget
              onHomeTap: () => _onTabTapped(keys.home, PortfolioSection.home),
              onAboutTap: () =>
                  _onTabTapped(keys.about, PortfolioSection.about),
              onSkillsTap: () =>
                  _onTabTapped(keys.skills, PortfolioSection.skills),
              onProjectsTap: () =>
                  _onTabTapped(keys.projects, PortfolioSection.projects),
              onContactTap: () =>
                  _onTabTapped(keys.contact, PortfolioSection.contact),
            );
          },
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification.metrics.pixels > 400) {
            // 3. Update the value without triggering a global setState
            if (!_showFabNotifier.value) _showFabNotifier.value = true;
          } else {
            if (_showFabNotifier.value) _showFabNotifier.value = false;
          }

          _updateActiveTabOnScroll();
          return false;
        },
        // Because there is no setState, this massive layout now only builds ONCE.
        child: PageStorage(
          bucket: _homeBucket,
          child: ResponsiveLayout(
            mobile: HomeScreenMobile(key: scrollKey, sectionKeys: keys),
            web: HomeScreenWeb(key: scrollKey, sectionKeys: keys),
            tablet: HomeScreenTab(key: scrollKey, sectionKeys: keys),
          ),
        ),
      ),

      // 4. Wrap ONLY the FAB in a ValueListenableBuilder
      floatingActionButton: ValueListenableBuilder<bool>(
        valueListenable: _showFabNotifier,
        builder: (context, showFab, child) {
          return AnimatedScale(
            // Use the local 'showFab' variable provided by the builder
            scale: showFab ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutBack,
            child: FloatingActionButton(
              onPressed: () => _onTabTapped(keys.home, PortfolioSection.home),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(Icons.keyboard_arrow_up_rounded, size: 28),
            ),
          );
        },
      ),
    );
  }
}
