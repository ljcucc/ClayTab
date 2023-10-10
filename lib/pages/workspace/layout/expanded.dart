import 'dart:ui';

import 'package:code_playground/pages/workspace/side_panel.dart';
import 'package:code_playground/components/toolbar_item.dart';
import 'package:code_playground/components/touchpad.dart';
import 'package:flutter/material.dart';
import 'package:code_playground/components/material_container.dart';
import 'dart:math' as math; // import this

class ExpandedStyle {
  late final bool haveBorder;
  final double innerElevation;
  final double outterElevation;

  ExpandedStyle({
    this.innerElevation = 0,
    this.outterElevation = 0,
    bool border = false,
  }) {
    this.haveBorder = border;
  }

  BoxBorder? border(color) => haveBorder
      ? Border.all(
          color: color,
          width: 1.5,
        )
      : null;

  factory ExpandedStyle.border() {
    return ExpandedStyle(border: true);
  }

  factory ExpandedStyle.backgroundBorder() {
    return ExpandedStyle(border: true, innerElevation: 2, outterElevation: 2);
  }

  factory ExpandedStyle.inner() {
    return ExpandedStyle(innerElevation: 2);
  }

  factory ExpandedStyle.outter() {
    return ExpandedStyle(outterElevation: 2);
  }
}

class ExpandedTouchpad extends StatelessWidget {
  final BorderRadius? borderRadius;
  const ExpandedTouchpad({
    super.key,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(36),
      child: Container(
        height: 300,
        width: 250,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: MaterialContainer(
              elevation: 6,
              borderRadius: borderRadius,
              // backgroundColor: Theme.of(context).colorScheme.surface,
              backgroundColor: Colors.transparent,
              child: Touchpad(),
            ),
          ),
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
  final Widget leading;

  const ToolbarRail({
    super.key,
    required this.center,
    required this.trailer,
    required this.leading,
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
            widget.leading,
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

class ExpandedLayout extends StatefulWidget {
  final Widget body;
  final ImageProvider? backgroundImage;
  final ExpandedStyle style;

  const ExpandedLayout({
    super.key,
    required this.body,
    this.backgroundImage,
    required this.style,
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
      leading: Container(),
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
          setState(() {
            sideOpen = !sideOpen;
          });
        },
      ),
    );

    final color = Theme.of(context).colorScheme.primary;

    final centerWorkspace = Expanded(
      child: MaterialContainer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTint: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
        elevation: widget.style.innerElevation,
        border: widget.style.border(
            Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(.5)),
        child: Stack(
          children: [
            if (widget.backgroundImage != null)
              Positioned.fill(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(color, BlendMode.hue),
                  child: Image(
                    image: widget.backgroundImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Positioned.fill(
              child: Container(
                  color: Theme.of(context).colorScheme.surface.withOpacity(.0)),
            ),
            widget.body,
          ],
        ),
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

    return MaterialContainer(
      elevation: widget.style.outterElevation,
      borderRadius: BorderRadius.zero,
      backgroundColor: Theme.of(context).colorScheme.surface,
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
              child: padOpen
                  ? ExpandedTouchpad(
                      // borderRadius: BorderRadius.circular(100),
                      )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }
}
