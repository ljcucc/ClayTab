import 'package:code_playground/pages/workspace/side_panel.dart';
import 'package:code_playground/components/toolbar_item.dart';
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
        height: 300,
        width: 250,
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
      mainAxisSize: MainAxisSize.max,
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

class ToolbarRail extends StatefulWidget {
  final List<Widget> center;
  final Widget trailer;

  const ToolbarRail({
    super.key,
    required this.center,
    required this.trailer,
  });

  @override
  State<ToolbarRail> createState() => _ToolbarRailState();
}

class _ToolbarRailState extends State<ToolbarRail> {
  @override
  Widget build(BuildContext context) {
    final surface = Theme.of(context).colorScheme.surface;

    return SafeArea(
      // minimum: EdgeInsets.only(top: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            ToolbarItem(
              icon: Icon(Icons.grid_view),
            ),
            Expanded(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                direction: Axis.vertical,
                children: widget.center,
              ),
            ),
            widget.trailer,
          ],
        ),
      ),
    );
  }
}

class StyledExpandedLayoutContainer extends StatelessWidget {
  final ImageProvider? backgroundImage;
  final Widget child;

  const StyledExpandedLayoutContainer({
    super.key,
    this.backgroundImage,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Stack(
      children: [
        if (backgroundImage != null)
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(color, BlendMode.hue),
              child: Image(
                image: backgroundImage!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        MaterialContainer(
          elevation: 4,
          borderRadius: BorderRadius.zero,
          backgroundColor: backgroundImage == null
              ? Theme.of(context).colorScheme.surface
              : Theme.of(context).colorScheme.surface.withOpacity(.5),
          child: child,
        ),
      ],
    );
  }
}

class ExpandedLayout extends StatefulWidget {
  final Widget body;
  final ImageProvider? backgroundImage;

  const ExpandedLayout({
    super.key,
    required this.body,
    this.backgroundImage,
  });

  @override
  State<ExpandedLayout> createState() => _ExpandedLayoutState();
}

class _ExpandedLayoutState extends State<ExpandedLayout> {
  bool sideOpen = false;
  int cur = 0;

  bool padOpen = false;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      scrolledUnderElevation: 0,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      toolbarHeight: 48,
      // leading: Container(),
      // title: TopToolbar(),
      actions: [
        ToggleToolbarItem(
          iconOn: Icon(Icons.videogame_asset_off_outlined),
          iconOff: Icon(Icons.videogame_asset_outlined),
          onTrunOff: () {
            setState(() {
              padOpen = false;
            });
          },
          onTrunOn: () {
            setState(() {
              padOpen = true;
            });
          },
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

    final toolbarRail = ToolbarRail(
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
        icon: Icon(Icons.settings_outlined, size: 24),
        onTap: () {
          setState(() {
            sideOpen = !sideOpen;
          });
        },
      ),
    );

    final centerWorkspace = Expanded(
      child: MaterialContainer(
        backgroundColor: widget.backgroundImage == null
            ? Theme.of(context).colorScheme.surface
            : Colors.transparent,
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
          SideDrawer(
            open: sideOpen,
            child: Container(),
          ),
          centerWorkspace,
        ],
      ),
    );

    return StyledExpandedLayoutContainer(
      backgroundImage: widget.backgroundImage,
      child: Stack(
        children: [
          SafeArea(
            minimum: EdgeInsets.all(16).copyWith(
              left: 0,
              top: 8,
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
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 100),
              switchOutCurve: Curves.easeInOut,
              switchInCurve: Curves.easeInOut,
              transitionBuilder: (child, animation) {
                final tween = Tween<double>(begin: 0.95, end: 1);
                return ScaleTransition(
                  scale: animation.drive(tween),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: padOpen ? ExpandedTouchpad() : Container(),
            ),
          ),
        ],
      ),
    );
  }
}
