import 'package:flutter/material.dart';

import 'package:code_playground/pages/home/home.dart';
import 'package:code_playground/pages/home/home_layout.dart';

// uitls widget
import 'package:code_playground/widgets/toolbar_item.dart';

// sections page
import 'package:code_playground/pages/extensions/extensions.dart';
import 'package:code_playground/pages/labs/labs.dart';
import 'package:code_playground/pages/projects/projects.dart';

class HomePageView extends StatelessWidget {
  final HomePageState controller;

  const HomePageView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final fab = FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      elevation: 0,
      child: const Icon(Icons.add),
      onPressed: () async {
        controller.onNewProject();
      },
    );

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
        ),
        HomePageSectionDestination(
          body: ExtensionsPage(),
          icon: Icon(Icons.extension_outlined),
          label: Text("Extensions"),
        ),
        HomePageSectionDestination(
          body: LabsPage(),
          icon: Icon(Icons.science_outlined),
          label: Text("Labs"),
        ),
      ],
    );
  }
}
