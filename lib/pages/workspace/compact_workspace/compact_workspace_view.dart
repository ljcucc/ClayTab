import 'package:code_playground/pages/workspace/compact_workspace/compact_workspace.dart';
import 'package:code_playground/pages/workspace/compact_workspace/compact_touchpad.dart';
import 'package:code_playground/pages/workspace/compact_workspace/medium_touchpad.dart';
import 'package:code_playground/widgets/code_editor/text_editor.dart';
import 'package:code_playground/widgets/material_container.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class CompactWorkspaceView extends StatelessWidget {
  final CompactLayoutState controller;

  const CompactWorkspaceView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return MaterialContainer(
      borderRadius: BorderRadius.zero,
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: 1,
          destinations: const [
            NavigationDestination(
              icon: Icon(Symbols.play_arrow),
              label: "Run",
            ),
            NavigationDestination(
              icon: Icon(Symbols.code_blocks_rounded),
              label: "Editor",
            ),
            NavigationDestination(
              icon: Icon(Symbols.folder),
              label: "Assets",
            ),
            NavigationDestination(
              icon: Icon(Symbols.folder_data),
              label: "Git",
            ),
          ],
        ),
        body: SafeArea(
          minimum: EdgeInsets.symmetric(vertical: 32, horizontal: 0)
              .copyWith(bottom: 8, top: 0),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTapDown: (detials) {
                    controller.onType = false;
                  },
                  child: SafeArea(
                    minimum: EdgeInsets.symmetric(horizontal: 12),
                    child: MaterialContainer(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(24),
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      child: CodeEditor(),
                    ),
                  ),
                ),
              ),
              if (deviceWidth > 580) MediumTouchpad(controller: controller),
              if (deviceWidth <= 580) CompactTouchpad(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
