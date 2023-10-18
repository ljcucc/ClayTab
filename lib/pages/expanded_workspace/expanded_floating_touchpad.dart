import 'dart:ui';

import 'package:code_playground/pages/expanded_workspace/expanded_workspace.dart';
import 'package:code_playground/widgets/material_container.dart';
import 'package:code_playground/widgets/touchpad.dart';
import 'package:flutter/material.dart';

class ExpandedTouchpad extends StatelessWidget {
  final BorderRadius? borderRadius;
  const ExpandedTouchpad({
    super.key,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(36),
      child: Container(
        height: 300,
        width: 250,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: MaterialContainer(
              elevation: 6,
              borderRadius: borderRadius,
              // backgroundColor: Theme.of(context).colorScheme.surface,
              backgroundColor: Colors.transparent,
              child: Touchpad(),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedFloatingTouchpad extends StatelessWidget {
  final ExpandedWorkspaceState controller;

  const ExpandedFloatingTouchpad({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 100),
      switchOutCurve: Curves.easeInOut,
      switchInCurve: Curves.easeInOut,
      transitionBuilder: (child, animation) {
        final tween = Tween<double>(begin: 0.95, end: 1);
        return ScaleTransition(
          scale: animation.drive(tween),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child:
          controller.isTouchpadOpended ? const ExpandedTouchpad() : Container(),
    );
  }
}
