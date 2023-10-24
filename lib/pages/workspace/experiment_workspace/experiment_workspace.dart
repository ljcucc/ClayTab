import 'package:code_playground/pages/workspace/experiment_workspace/experiment_workspace_view.dart';
import 'package:flutter/material.dart';

class ExperimentWorkspace extends StatefulWidget {
  const ExperimentWorkspace({super.key});

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
