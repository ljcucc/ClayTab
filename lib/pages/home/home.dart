import 'package:code_playground/widgets/material_container.dart';
import 'package:code_playground/widgets/toolbar_item.dart';
import 'package:code_playground/pages/extensions/extensions.dart';
import 'package:code_playground/pages/labs/labs.dart';
import 'package:code_playground/pages/projects_section/projects_section.dart';
import 'package:code_playground/pages/new_project.dart';
import 'package:code_playground/pages/settings.dart';
import 'package:code_playground/pages/workspace/workspace.dart';
import 'package:flutter/material.dart';

class HomePageSectionDestination {
  final Widget body;
  final Text label;
  final Icon icon;
  final Widget? fab;

  HomePageSectionDestination({
    required this.body,
    required this.label,
    required this.icon,
    this.fab,
  });
}

class HomePageLayout extends StatefulWidget {
  final List<HomePageSectionDestination> destinations;
  final Widget? leading;

  const HomePageLayout({
    super.key,
    required this.destinations,
    this.leading,
  });

  @override
  State<HomePageLayout> createState() => _HomePageLayoutState();
}

class _HomePageLayoutState extends State<HomePageLayout> {
  int selectedIndex = 0;

  _openSettings() async {
    await Navigator.of(context).push(MaterialPageRoute(
      fullscreenDialog: false,
      builder: (context) {
        return SettingsPage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialContainer(
        elevation: 2,
        borderRadius: BorderRadius.zero,
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Row(
          children: [
            NavigationRail(
              backgroundColor: Colors.transparent,
              labelType: NavigationRailLabelType.selected,
              leading: SafeArea(
                minimum: EdgeInsets.symmetric(vertical: 8),
                child: widget.leading ?? Container(),
              ),
              trailing: Expanded(
                child: SafeArea(
                  minimum: EdgeInsets.symmetric(vertical: 16),
                  child: Column(children: [
                    Spacer(),
                    ToolbarItem(
                      icon: Icon(Icons.settings_outlined),
                      onTap: _openSettings,
                    ),
                  ]),
                ),
              ),
              destinations: [
                for (var item in widget.destinations)
                  NavigationRailDestination(
                    icon: item.icon,
                    label: item.label,
                  ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) =>
                  setState(() => selectedIndex = value),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 100),
                switchOutCurve: Curves.easeInOut,
                switchInCurve: Curves.easeInOut,
                child: widget.destinations[selectedIndex].body,
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: widget.destinations[selectedIndex].fab,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final fab = FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      elevation: 0,
      child: Icon(Icons.add),
      onPressed: () async {
        // await Navigator.of(context).push(
        //   MaterialPageRoute(
        //     fullscreenDialog: true,
        //     builder: (context) {
        //       return NewProjectPage();
        //     },
        //   ),
        // );

        await Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) {
              return WorkspaceMainLayout();
            },
          ),
        );
      },
    );

    return HomePageLayout(
      leading: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Column(
          children: [
            // ToolbarItem(
            //   icon: Icon(Icons.menu),
            //   onTap: () {},
            // ),
            SizedBox(height: 24),
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
