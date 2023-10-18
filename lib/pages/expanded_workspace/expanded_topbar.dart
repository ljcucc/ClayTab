import 'package:code_playground/pages/expanded_workspace/expanded_workspace.dart';
import 'package:code_playground/widgets/toolbar_item.dart';
import 'package:flutter/material.dart';

class ExpandedTopbar extends StatelessWidget {
  final ExpandedWorkspaceState controller;

  const ExpandedTopbar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      toolbarHeight: 48,
      leading: Container(),
      actions: [
        ToggleToolbarItem(
          iconOn: Icon(Icons.videogame_asset_off_outlined),
          iconOff: Icon(Icons.videogame_asset_outlined),
          onTrunOff: () => controller.setTouchPanel(false),
          onTrunOn: () => controller.setTouchPanel(true),
        ),
        SizedBox(
          width: 8,
        ),
        ToolbarItem(
          icon: Icon(Icons.smartphone),
        ),
        SizedBox(
          width: 8,
        ),
        ToolbarItem(
          icon: Icon(Icons.info_outline),
        )
      ],
    );
  }
}
