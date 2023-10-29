import 'package:code_playground/pages/editor/editor.dart';
import 'package:code_playground/pages/overview/overview.dart';
import 'package:code_playground/pages/workspace/experiment_workspace/experiment_workspace.dart';
import 'package:code_playground/utils/project/project.dart';
import 'package:code_playground/widgets/code_editor/block/editor.dart';
import 'package:code_playground/pages/workspace/compact_workspace/compact_workspace.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class WorkspaceDestination {
  final String label;
  final Widget icon;
  final Widget Function(BuildContext context) builder;

  WorkspaceDestination({
    required this.label,
    required this.icon,
    required this.builder,
  });
}

class WorkspaceMainLayout extends StatelessWidget {
  final ProjectData project;

  const WorkspaceMainLayout({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    print(project.name);

    final destinations = [
      WorkspaceDestination(
        label: "Overview",
        icon: Icon(Symbols.dashboard),
        builder: (context) => OverviewPage(),
      ),
      WorkspaceDestination(
        label: "Editor",
        icon: Icon(Symbols.code),
        builder: (context) => EditorPage(),
      ),
      WorkspaceDestination(
        label: "Preview",
        icon: Icon(Symbols.play_arrow),
        builder: (context) => Container(),
      ),
      WorkspaceDestination(
        label: "Assets",
        icon: Icon(Symbols.folder),
        builder: (context) => Container(),
      ),
      // WorkspaceDestination(
      //   label: "Git",
      //   icon: Icon(Symbols.folder_data),
      //   builder: (context) => Container(),
      // ),
    ];

    final width = MediaQuery.of(context).size.width;

    if (width < 840) {
      return CompactWorkspace(
        desinations: destinations,
      );
    }

    return ExperimentWorkspace(
      destinations: destinations,
    );
  }
}
