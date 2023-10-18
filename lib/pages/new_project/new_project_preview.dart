import 'package:code_playground/widgets/shaped_icon.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:code_playground/widgets/mouse_region_builder.dart';

class NewProjectPreview extends StatelessWidget {
  final ShapeTypes shape;
  const NewProjectPreview({
    super.key,
    required this.shape,
  });

  @override
  Widget build(BuildContext context) {
    final duration = Duration(milliseconds: 150);
    final curve = Curves.easeInOut;

    final shape = ShapedIcon(
      color: Theme.of(context).colorScheme.primary,
      child: Icon(
        Icons.android,
        size: 48,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      shape: this.shape,
    );

    final event = MouseRegionBuilder(builder: (context, enter, hover, exit) {
      return AnimatedRotation(
        turns: hover != null ? 0.02 : 0,
        duration: duration,
        child: AnimatedScale(
          curve: curve,
          duration: duration,
          scale: hover != null ? 1.02 : 1,
          child: shape,
        ),
      );
    });

    final preview = SizedBox(
      width: 300,
      child: Center(
        child: SizedBox(
          width: 150,
          child: event,
        ),
      ),
    );

    return preview;
  }
}
