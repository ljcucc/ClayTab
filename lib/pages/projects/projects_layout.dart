import 'package:flutter/material.dart';

class ProjectsPageLayout extends StatelessWidget {
  final Widget child;
  final Widget header;

  const ProjectsPageLayout({
    super.key,
    required this.child,
    required this.header,
  });

  @override
  Widget build(BuildContext context) {
    // minimum: EdgeInsets.all(24).copyWith(bottom: 0, top: 32),
    return Column(
      children: [
        // SafeArea on top of the screen
        SafeArea(
          minimum: const EdgeInsets.only(top: 24),
          child: Container(),
        ),
        Expanded(
          child: SizedBox.expand(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 32)
                          .copyWith(bottom: 0),
                  child: header,
                ),
                SizedBox(height: 24),
                Expanded(child: child),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
