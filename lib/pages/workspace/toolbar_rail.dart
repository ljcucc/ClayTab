import 'package:flutter/material.dart';

class ToolbarItem extends StatelessWidget {
  final Icon icon;

  const ToolbarItem({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith((states) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          );
        }),
      ),
      onPressed: () {},
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: icon,
      ),
    );
  }
}

class ToolbarRail extends StatefulWidget {
  const ToolbarRail({super.key});

  @override
  State<ToolbarRail> createState() => _ToolbarRailState();
}

class _ToolbarRailState extends State<ToolbarRail> {
  @override
  Widget build(BuildContext context) {
    final surface = Theme.of(context).colorScheme.surface;

    return SafeArea(
      // minimum: EdgeInsets.only(top: 8),
      child: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                children: [
                  ToolbarItem(
                    icon: Icon(Icons.folder_outlined, size: 24),
                  ),
                  ToolbarItem(
                    icon: Icon(Icons.timeline, size: 24),
                  ),
                ],
              ),
            ),
            ToolbarItem(
              icon: Icon(Icons.settings_outlined, size: 24),
            ),
          ],
        ),
      ),
    );
  }
}
