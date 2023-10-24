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
      labelType: NavigationRailLabelType.selected,
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
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Symbols.play_arrow),
          label: Text("Run"),
        ),
        NavigationRailDestination(
          icon: Icon(Symbols.code_blocks_rounded),
          label: Text("Editor"),
        ),
        NavigationRailDestination(
          icon: Icon(Symbols.folder),
          label: Text("Assets"),
        ),
        NavigationRailDestination(
          icon: Icon(Symbols.folder_data),
          label: Text("Git"),
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
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                leading: Container(),
                backgroundColor: Colors.transparent,
                scrolledUnderElevation: 0,
              ),
              body: SafeArea(
                minimum: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: MaterialContainer(
                        backgroundColor: colorScheme.surface,
                        borderRadius: BorderRadius.circular(24),
                        elevation: 2,
                        child: CodeEditor(),
                      ),
                    ),
                    SizedBox(width: 16),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          Expanded(
                            child: SuggestionList(),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            height: 300,
                            child: Touchpad(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
