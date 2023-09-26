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

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: MaterialContainer(
        elevation: 1,
        child: BackButton(
          onPressed: () {
            setState(() {
              sideOpen = !sideOpen;
            });
          },
        ),
      ),
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

    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar,
          body: body,
        ),
      ),
    );
  }
}
