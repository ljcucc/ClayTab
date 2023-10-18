import 'package:code_playground/pages/expanded_workspace/center_space.dart';
import 'package:code_playground/pages/expanded_workspace/expanded_floating_touchpad.dart';
import 'package:code_playground/pages/expanded_workspace/expanded_style.dart';
import 'package:code_playground/pages/expanded_workspace/expanded_toolbar_rail.dart';
import 'package:code_playground/pages/expanded_workspace/expanded_topbar.dart';
import 'package:code_playground/pages/expanded_workspace/expanded_workspace.dart';
import 'package:code_playground/pages/expanded_workspace/expanded_workspace_layout.dart';
import 'package:code_playground/widgets/code_editor/text_editor.dart';
import 'package:code_playground/widgets/side_panel.dart';
import 'package:flutter/material.dart';

class ExpandedWorkspaceView extends StatelessWidget {
  final ExpandedWorkspaceState controller;

  const ExpandedWorkspaceView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var defaultStyle =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? ExpandedStyle.inner()
            : ExpandedStyle.outter();

    return ExpandedWorkspaceLayout(
      style: defaultStyle,
      side: ExpandedToolbarRail(controller: controller),
      topbar: ExpandedTopbar(controller: controller),
      body: Padding(
        padding:
            EdgeInsets.only(top: 8), // to seperate topbar and center workspace
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SidePanel(
              open: controller.isPanelOpened,
              child: Container(),
            ),
            CenterSpace(
              child: CodeEditor(),
              style: defaultStyle,
            ),
          ],
        ),
      ),
      floating: ExpandedFloatingTouchpad(controller: controller),
    );
  }
}
