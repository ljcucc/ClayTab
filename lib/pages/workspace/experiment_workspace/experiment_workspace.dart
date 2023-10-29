import 'package:code_playground/pages/workspace/experiment_workspace/experiment_workspace_view.dart';
import 'package:code_playground/pages/workspace/workspace.dart';
import 'package:flutter/material.dart';

class ExperimentWorkspace extends StatefulWidget {
  final List<WorkspaceDestination> destinations;

  const ExperimentWorkspace({
    super.key,
    required this.destinations,
  });

  @override
  State<ExperimentWorkspace> createState() => ExperimentWorkspaceState();
}

class ExperimentWorkspaceState extends State<ExperimentWorkspace> {
  int selectedTab = 1;

  void switchTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExperimentWorkspaceView(controller: this);
  }
}
