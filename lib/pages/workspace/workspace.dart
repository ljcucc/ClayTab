import 'package:code_playground/pages/workspace/experiment_workspace/experiment_workspace.dart';
import 'package:code_playground/utils/project/project.dart';
import 'package:code_playground/widgets/code_editor/block/editor.dart';
import 'package:code_playground/pages/workspace/compact_workspace/compact_workspace.dart';
import 'package:flutter/material.dart';

class WorkspaceMainLayout extends StatelessWidget {
  final ProjectData project;

  const WorkspaceMainLayout({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    print(project.name);

    final width = MediaQuery.of(context).size.width;

    if (width < 840) {
      return CompactWorkspace();
    }

    return ExperimentWorkspace();
  }
}
