import 'dart:ui';

import 'package:flutter/material.dart';

class MaterialContainer extends StatelessWidget {
  final double elevation;
  final Widget child;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? surfaceTint;
  final BoxBorder? border;
  final Clip clipBehavior;

  MaterialContainer({
    super.key,
    required this.elevation,
    required this.child,
    this.borderRadius,
    this.backgroundColor,
    this.surfaceTint,
    this.border,
    this.clipBehavior = Clip.hardEdge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: border,
        borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(32)),
      ),
      child: Material(
        elevation: elevation,
        borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(32)),
        clipBehavior: this.clipBehavior,
        shadowColor: Colors.transparent,
        surfaceTintColor: surfaceTint ?? Theme.of(context).colorScheme.primary,
        color: backgroundColor ?? Colors.transparent,
        child: child,
      ),
    );
  }
}
