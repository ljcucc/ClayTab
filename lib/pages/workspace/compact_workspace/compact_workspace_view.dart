import 'package:code_playground/pages/workspace/compact_workspace/compact_workspace.dart';
import 'package:code_playground/widgets/code_editor/text_editor.dart';
import 'package:code_playground/widgets/material_container.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class CompactWorkspaceView extends StatelessWidget {
  final CompactLayoutState controller;

  const CompactWorkspaceView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return MaterialContainer(
      borderRadius: BorderRadius.zero,
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: controller.selectedTab,
          // backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
          // surfaceTintColor: Colors.transparent,
          surfaceTintColor: Theme.of(context).colorScheme.primaryContainer,
          destinations: [
            for (var desinations in controller.widget.desinations)
              NavigationDestination(
                icon: desinations.icon,
                label: desinations.label,
              ),
          ],
          onDestinationSelected: (value) => controller.selectedTab = value,
        ),
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 150),
          child: controller.widget.desinations[controller.selectedTab]
              .builder(context),
        ),
      ),
    );
  }
}
