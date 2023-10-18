import 'package:code_playground/pages/expanded_workspace/expanded_workspace.dart';
import 'package:code_playground/widgets/toolbar_item.dart';
import 'package:code_playground/widgets/toolbar_rail.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math; // import this

class ExpandedToolbarRail extends StatelessWidget {
  final ExpandedWorkspaceState controller;

  const ExpandedToolbarRail({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ToolbarRail(
      center: [
        ToolbarItem(
          icon: Icon(Icons.folder_open, size: 24),
        ),
        ToolbarItem(
          icon: Icon(Icons.account_tree_rounded, size: 24),
        ),
        ToolbarItem(
          icon: Icon(Icons.table_view, size: 24),
        ),
      ],
      trailer: ToolbarItem(
        icon: Icon(Icons.terminal, size: 24),
        onTap: () {
          controller.toggleSidePanel();
        },
      ),
      leading: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: ToolbarItem(
          icon: Icon(Icons.logout),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
