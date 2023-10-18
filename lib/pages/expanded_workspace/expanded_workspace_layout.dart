import 'package:code_playground/pages/expanded_workspace/expanded_style.dart';
import 'package:code_playground/widgets/material_container.dart';
import 'package:flutter/material.dart';

class ExpandedWorkspaceLayout extends StatelessWidget {
  final ExpandedStyle? style;
  final Widget side;
  final Widget topbar;
  final Widget body;
  final Widget? floating;

  /// This widget provided the very basic layout for expanded & medium devices
  const ExpandedWorkspaceLayout({
    super.key,
    required this.side,
    required this.topbar,
    required this.body,
    this.floating,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final style = this.style ?? ExpandedStyle.outter();
    return MaterialContainer(
      elevation: style.outterElevation,
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
                side,
                Expanded(
                  // the Scaffold before, now is column
                  child: Column(
                    children: [
                      topbar,
                      Expanded(child: body),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: floating ?? Container(),
          ),
        ],
      ),
    );
  }
}
