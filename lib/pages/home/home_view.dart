import 'package:code_playground/pages/settings.dart';
import 'package:flutter/material.dart';

import 'package:code_playground/pages/home/home.dart';
import 'package:code_playground/pages/home/home_layout.dart';

// uitls widget
import 'package:code_playground/widgets/toolbar_item.dart';

// sections page
import 'package:code_playground/pages/explore/explore.dart';
import 'package:code_playground/pages/profile/profile.dart';
import 'package:code_playground/pages/projects/projects.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class HomePageView extends StatelessWidget {
  final HomePageState controller;

  const HomePageView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // Hero must have a unique non-null tag. In this case, the following tag: <default FloatingActionButton tag>
    final fab = FloatingActionButton(
      heroTag: MediaQuery.of(context).size.width < 840 ? "compact" : "expanded",
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      elevation: 0,
      child: const Icon(Icons.add),
      onPressed: () async {
        controller.onNewProject();
      },
    );

    // return AdaptiveScaffold(
    //   selectedIndex: controller.selectedTab,
    //   onSelectedIndexChange: controller.onSelectedIndexChange,
    //   smallBreakpoint: const WidthPlatformBreakpoint(end: 700),
    //   mediumBreakpoint: const WidthPlatformBreakpoint(begin: 700, end: 1000),
    //   largeBreakpoint: const WidthPlatformBreakpoint(begin: 1000),
    //   useDrawer: false,
    //   destinations: const [
    //     NavigationDestination(
    //       icon: Icon(Icons.grid_view),
    //       label: "Projects",
    //     ),
    //     NavigationDestination(
    //       icon: Icon(Icons.extension_outlined),
    //       label: "Extensions",
    //     ),
    //     NavigationDestination(
    //       icon: Icon(Icons.settings_outlined),
    //       label: "Settings",
    //     ),
    //   ],
    //   body: (_) =>
    //       controller.selectedTab == 2 ? SettingsPage() : ProjectsSection(),
    //   smallBody: (_) =>
    //       controller.selectedTab == 2 ? SettingsPage() : ProjectsSection(),
    // );

    return HomePageLayout(
      trailing: Column(children: [
        Spacer(),
        ToolbarItem(
          icon: const Icon(Icons.settings_outlined),
          onTap: controller.openSettings,
        ),
      ]),
      leading: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            fab,
          ],
        ),
      ),
      destinations: [
        HomePageSectionDestination(
          body: ProjectsSection(),
          icon: Icon(Icons.grid_view),
          label: Text("Projects"),
          fab: MediaQuery.of(context).size.width < 840 ? fab : null,
        ),
        HomePageSectionDestination(
          body: ExplorePage(),
          icon: Icon(Icons.explore_outlined),
          label: Text("Explore"),
        ),
        HomePageSectionDestination(
          body: ProfilePage(),
          icon: Icon(Icons.account_circle_outlined),
          label: Text("Profile"),
        ),
      ],
    );
  }
}
