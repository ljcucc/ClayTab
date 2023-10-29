import 'package:code_playground/pages/workspace/experiment_workspace/experiment_workspace.dart';
import 'package:code_playground/widgets/code_editor/text_editor.dart';
import 'package:code_playground/widgets/material_container.dart';
import 'package:code_playground/widgets/suggestion_list.dart';
import 'package:code_playground/widgets/toolbar_item.dart';
import 'package:code_playground/widgets/touchpad.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class ExperimentWorkspaceView extends StatelessWidget {
  final ExperimentWorkspaceState controller;

  const ExperimentWorkspaceView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final navRail = NavigationRail(
      labelType: NavigationRailLabelType.all,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: ToolbarItem(
          tooltip: "Projects",
          icon: const Icon(Symbols.apps),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      groupAlignment: 0,
      trailing: Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ToolbarItem(
              tooltip: "Settings",
              icon: const Icon(Icons.settings_outlined),
              onTap: () {},
            ),
          ),
        ),
      ),
      destinations: [
        for (var destination in controller.widget.destinations)
          NavigationRailDestination(
            icon: destination.icon,
            label: Text(destination.label),
          ),
      ],
      selectedIndex: controller.selectedTab,
      onDestinationSelected: controller.switchTab,
    );

    return MaterialContainer(
      elevation: 0,
      backgroundColor: colorScheme.surface,
      borderRadius: BorderRadius.zero,
      child: Row(
        children: [
          navRail,
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 150),
              child: controller.widget.destinations[controller.selectedTab]
                  .builder(context),
            ),
          ),
        ],
      ),
    );
  }
}
