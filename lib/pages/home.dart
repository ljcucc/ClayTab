import 'package:code_playground/components/material_container.dart';
import 'package:code_playground/components/toolbar_item.dart';
import 'package:code_playground/pages/new_project.dart';
import 'package:code_playground/pages/settings.dart';
import 'package:code_playground/pages/workspace/main_layout.dart';
import 'package:flutter/material.dart';

class HomePageLayout extends StatefulWidget {
  final String title;
  final Widget body;
  final Widget? fab;

  const HomePageLayout({
    super.key,
    required this.body,
    required this.title,
    this.fab,
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
        elevation: 4,
        borderRadius: BorderRadius.zero,
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Row(
          children: [
            NavigationRail(
              labelType: NavigationRailLabelType.selected,
              leading: SafeArea(
                minimum: EdgeInsets.symmetric(vertical: 8),
                child: Column(children: []),
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
                NavigationRailDestination(
                  icon: Icon(Icons.workspaces_outlined),
                  label: Text("Sandboxes"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.dashboard_customize_outlined),
                  label: Text("Templates"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.cloud_outlined),
                  label: Text("Servers"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.menu_book),
                  label: Text("Learning"),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) =>
                  setState(() => selectedIndex = value),
            ),
            Expanded(
              child: SafeArea(
                minimum: EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        widget.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Expanded(child: SingleChildScrollView(child: widget.body)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: widget.fab,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final fab = FloatingActionButton.extended(
      label: Text("New Sandbox"),
      icon: Icon(Icons.add),
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
      title: "Recently",
      body: Placeholder(),
      fab: fab,
    );
  }
}
