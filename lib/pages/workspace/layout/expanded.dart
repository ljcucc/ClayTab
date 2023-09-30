import 'package:code_playground/pages/workspace/side_panel.dart';
import 'package:code_playground/pages/workspace/toolbar_rail.dart';
import 'package:code_playground/components/touchpad.dart';
import 'package:flutter/material.dart';
import 'package:code_playground/components/material_container.dart';

class ExpandedTouchpad extends StatelessWidget {
  const ExpandedTouchpad({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(36),
      child: Container(
        height: 350,
        width: 300,
        child: MaterialContainer(
          elevation: 4,
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: Touchpad(),
        ),
      ),
    );
  }
}

class TopToolbar extends StatelessWidget {
  const TopToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ToolbarItem(icon: Icon(Icons.undo)),
        SizedBox(
          width: 8,
        ),
        ToolbarItem(icon: Icon(Icons.redo)),
      ],
    );
  }
}

class ExpandedLayout extends StatefulWidget {
  final Widget body;

  const ExpandedLayout({
    super.key,
    required this.body,
  });

  @override
  State<ExpandedLayout> createState() => _ExpandedLayoutState();
}

class _ExpandedLayoutState extends State<ExpandedLayout> {
  bool sideOpen = false;
  int cur = 0;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      scrolledUnderElevation: 0,
      // centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: Container(),
      // title: TopToolbar(),
      actions: [
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

    final toolbarRail = ToolbarRail();

    final centerWorkspace = Expanded(
      child: MaterialContainer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        elevation: 0,
        child: widget.body,
      ),
    );

    final body = Padding(
      padding: EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideDrawer(open: sideOpen),
          centerWorkspace,
        ],
      ),
    );

    return MaterialContainer(
      elevation: 4,
      borderRadius: BorderRadius.zero,
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Stack(
        children: [
          SafeArea(
            minimum: EdgeInsets.all(16).copyWith(
              left: 0,
              // top: 8,
            ),
            child: Row(
              children: [
                toolbarRail,
                Expanded(
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: appBar,
                    body: body,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: ExpandedTouchpad(),
          ),
        ],
      ),
    );
  }
}
