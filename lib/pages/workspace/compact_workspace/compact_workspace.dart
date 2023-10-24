import 'package:code_playground/pages/workspace/compact_workspace/compact_workspace_view.dart';
import 'package:flutter/material.dart';

class CompactWorkspace extends StatefulWidget {
  const CompactWorkspace({
    super.key,
  });

  @override
  State<CompactWorkspace> createState() => CompactLayoutState();
}

class CompactLayoutState extends State<CompactWorkspace> {
  bool _onType = false;

  get onType => _onType;
  set onType(value) => setState(() {
        _onType = value;
      });

  @override
  Widget build(BuildContext context) {
    return CompactWorkspaceView(controller: this);
  }
}
