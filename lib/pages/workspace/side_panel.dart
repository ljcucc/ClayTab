import 'package:flutter/material.dart';
import 'package:code_playground/components/material_container.dart';

class SideDrawer extends StatelessWidget {
  final bool open;
  final Widget child;

  const SideDrawer({
    super.key,
    required this.open,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final double width = open ? 316 : 0;
    return AnimatedContainer(
      curve: Curves.easeOutQuart,
      width: width,
      clipBehavior: Clip.hardEdge,
      duration: const Duration(milliseconds: 350),
      alignment: Alignment.topRight,
      decoration: BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: MaterialContainer(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 300,
              child: SizedBox.expand(
                child: Column(
                  children: [
                    child,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
