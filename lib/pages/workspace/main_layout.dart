import 'package:code_playground/pages/workspace/side_panel.dart';
import 'package:code_playground/pages/workspace/toolbar_rail.dart';
import 'package:flutter/material.dart';
import 'package:code_playground/components/material_container.dart';

class MainLayout extends StatefulWidget {
  final Widget body;

  const MainLayout({
    super.key,
    required this.body,
  });

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  bool sideOpen = false;
  int cur = 0;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      scrolledUnderElevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: Container(),
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
            child: FloatingTouchpadLayer(),
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
