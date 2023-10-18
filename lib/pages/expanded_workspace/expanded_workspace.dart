import 'package:code_playground/pages/expanded_workspace/background_img_provider.dart';
import 'package:code_playground/pages/expanded_workspace/expanded_workspace_view.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart'; // import this

/// Workspace layout for expanded device
class ExpandedWorkspace extends StatefulWidget {
  const ExpandedWorkspace({super.key});

  @override
  State<ExpandedWorkspace> createState() => ExpandedWorkspaceState();
}

class ExpandedWorkspaceState extends State<ExpandedWorkspace> {
  bool isPanelOpened = false;
  bool isTouchpadOpended = false;
  BackgroundImageProvider _backgroundImageProvider = BackgroundImageProvider();

  void setTouchPanel(bool state) {
    setState(() {
      isTouchpadOpended = state;
    });
  }

  void toggleSidePanel() {
    setState(() {
      isPanelOpened = !isPanelOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _backgroundImageProvider),
      ],
      child: ExpandedWorkspaceView(controller: this),
    );
  }
}
