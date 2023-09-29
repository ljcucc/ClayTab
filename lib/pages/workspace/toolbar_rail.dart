import 'package:flutter/material.dart';

class ToolbarItem extends StatelessWidget {
  final Icon icon;
  final Color? backgroundColor;

  const ToolbarItem({
    super.key,
    required this.icon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return backgroundColor ?? Colors.transparent ?? backgroundColor;
        }),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
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
                    icon: Icon(Icons.folder_open, size: 24),
                  ),
                  ToolbarItem(
                    icon: Icon(Icons.account_tree_rounded, size: 24),
                  ),
                  ToolbarItem(
                    icon: Icon(Icons.table_view, size: 24),
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
