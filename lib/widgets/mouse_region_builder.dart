import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MouseRegionBuilder extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    PointerEnterEvent? enter,
    PointerHoverEvent? hover,
    PointerExitEvent? exit,
  ) builder;
  const MouseRegionBuilder({
    super.key,
    required this.builder,
  });

  @override
  State<MouseRegionBuilder> createState() => _MouseRegionBuilderState();
}

class _MouseRegionBuilderState extends State<MouseRegionBuilder> {
  PointerEnterEvent? _enter;
  PointerExitEvent? _exit;
  PointerHoverEvent? _hover;

  _clear() {
    _enter = null;
    _exit = null;
    _hover = null;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _clear();
          _enter = event;
        });
      },
      onExit: (event) {
        setState(() {
          _clear();
          _exit = event;
        });
      },
      onHover: (event) {
        setState(() {
          _clear();
          _hover = event;
        });
      },
      child: widget.builder(context, _enter, _hover, _exit),
    );
  }
}
