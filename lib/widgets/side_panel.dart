import 'package:flutter/material.dart';
import 'package:code_playground/widgets/material_container.dart';

class SidePanel extends StatelessWidget {
  final bool open;
  final Widget child;
  final double? width;

  const SidePanel({
    super.key,
    required this.open,
    required this.child,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final double width = open ? (this.width ?? 316) : 0;
    return AnimatedContainer(
      curve: Curves.easeOutQuint,
      width: width,
      clipBehavior: Clip.hardEdge,
      duration: const Duration(milliseconds: 350),
      alignment: Alignment.topRight,
      decoration: BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: MaterialContainer(
          borderRadius: BorderRadius.circular(24),
          elevation: 0,
          // backgroundColor: Theme.of(context).colorScheme.surface,
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
