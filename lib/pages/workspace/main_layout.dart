import 'package:code_playground/pages/workspace/side_panel.dart';
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
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: Container(),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert),
        )
      ],
    );

    final centerWorkspace = Expanded(
      child: MaterialContainer(
        elevation: 1,
        child: widget.body,
      ),
    );

    final body = Padding(
      padding: EdgeInsets.only(top: 16),
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
        elevation: 1,
        child: BackButton(
          onPressed: () {},
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
      ],
    );

    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        minimum: EdgeInsets.all(16).copyWith(
          left: 0,
          top: 0,
        ),
        child: Row(
          children: [
            navigationRail,
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
    );
  }
}
