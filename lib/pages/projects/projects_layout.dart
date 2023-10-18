import 'package:flutter/material.dart';
import 'package:code_playground/widgets/material_container.dart';

class ProjectsPageLayout extends StatelessWidget {
  final Widget child;
  const ProjectsPageLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // minimum: EdgeInsets.all(24).copyWith(bottom: 0, top: 32),
    return Column(
      children: [
        // SafeArea on top of the screen
        SafeArea(
          minimum: const EdgeInsets.only(top: 32),
          child: Container(),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(24).copyWith(bottom: 0, top: 0),
            child: SizedBox.expand(
              child: MaterialContainer(
                elevation: 0,
                borderRadius: BorderRadius.circular(24).copyWith(
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
                backgroundColor: Theme.of(context).colorScheme.surface,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                              vertical: 24, horizontal: 32)
                          .copyWith(bottom: 0),
                      child: Text(
                        "Projects",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Expanded(child: child),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
