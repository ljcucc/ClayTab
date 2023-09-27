import 'package:flutter/material.dart';
import 'package:code_playground/components/material_container.dart';

class MaterialContainer extends StatelessWidget {
  final double elevation;
  final Widget child;
  final BorderRadius? borderRadius;
  Color? backgroundColor;
  Color? surfaceTint;

  MaterialContainer({
    super.key,
    required this.elevation,
    required this.child,
    this.borderRadius,
    this.backgroundColor,
    this.surfaceTint,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(32)),
      clipBehavior: Clip.hardEdge,
      shadowColor: Colors.transparent,
      surfaceTintColor: surfaceTint ?? Theme.of(context).colorScheme.primary,
      color: backgroundColor ?? Colors.transparent,
      child: child,
    );
  }
}
