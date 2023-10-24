import 'package:code_playground/widgets/material_container.dart';
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
  final Widget? trailing;

  const HomePageLayout({
    super.key,
    required this.destinations,
    this.leading,
    this.trailing,
  });

  @override
  State<HomePageLayout> createState() => _HomePageLayoutState();
}

class _HomePageLayoutState extends State<HomePageLayout> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialContainer(
      elevation: 2,
      borderRadius: BorderRadius.zero,
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Row(
          children: [
            if (MediaQuery.of(context).size.width > 840)
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
                    child: Container(child: widget.trailing),
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
        floatingActionButton: widget.destinations[selectedIndex].fab,
        bottomNavigationBar: MediaQuery.of(context).size.width > 840
            ? null
            : NavigationBar(
                onDestinationSelected: (value) => setState(() {
                  selectedIndex = value;
                }),
                selectedIndex: selectedIndex,
                destinations: [
                  for (var item in widget.destinations)
                    NavigationDestination(
                      icon: item.icon,
                      label: item.label.data ?? "",
                    ),
                ],
              ),
      ),
    );
  }
}
