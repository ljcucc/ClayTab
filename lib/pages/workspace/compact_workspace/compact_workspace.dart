import 'package:code_playground/pages/workspace/compact_workspace/compact_workspace_view.dart';
import 'package:code_playground/pages/workspace/workspace.dart';
import 'package:flutter/material.dart';

class CompactWorkspace extends StatefulWidget {
  final List<WorkspaceDestination> desinations;

  const CompactWorkspace({
    super.key,
    required this.desinations,
  });

  @override
  State<CompactWorkspace> createState() => CompactLayoutState();
}

class CompactLayoutState extends State<CompactWorkspace> {
  int _selectedTab = 1;

  int get selectedTab => _selectedTab;
  set selectedTab(int index) => setState(() {
        _selectedTab = index;
      });

  @override
  Widget build(BuildContext context) {
    return CompactWorkspaceView(controller: this);
  }
}
