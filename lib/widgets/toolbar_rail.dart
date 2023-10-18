import 'package:flutter/material.dart';

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
