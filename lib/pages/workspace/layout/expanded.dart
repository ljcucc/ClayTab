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
        borderRadius: BorderRadius.circular(20),
        elevation: 2,
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

    final navigationRail = NavigationRail(
      leading: MaterialContainer(
        elevation: 0,
        child: SizedBox(
          width: 50,
          height: 50,
          child: BackButton(
            onPressed: () {},
          ),
        ),
      ),
      groupAlignment: 0,
      labelType: NavigationRailLabelType.all,
      selectedIndex: cur,
      onDestinationSelected: (selected) {
        setState(() {
          cur = selected;
          sideOpen = cur != 0;
        });
      },
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.code),
          label: Text("Code"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.folder),
          label: Text("Files"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.timeline),
          label: Text("Version"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings),
          label: Text("Settings"),
        ),
      ],
    );

    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: ExpandedTouchpad(),
          ),
          SafeArea(
            minimum: EdgeInsets.all(16).copyWith(
              left: 0,
              // top: 8,
            ),
            child: Row(
              children: [
                // navigationRail,

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
        ],
      ),
    );
  }
}
