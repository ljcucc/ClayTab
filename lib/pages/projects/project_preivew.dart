import 'dart:math';

import 'package:code_playground/widgets/shaped_icon.dart';
import 'package:flutter/material.dart';

class ProjectPreview extends StatelessWidget {
  final ColorScheme? colorScheme;
  final ShapedIconData preview;

  const ProjectPreview({
    super.key,
    this.colorScheme,
    required this.preview,
  });

  @override
  Widget build(BuildContext context) {
    final colors = colorScheme ?? Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colors.primaryContainer.withOpacity(.5),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: SizedBox(
            height: 80,
            width: 80,
            child: ShapedIcon(
              shape: preview.shape ?? ShapeTypes.Clover,
              color: colors.primary.withOpacity(.75),
              child: Icon(preview.icon, size: 32, color: colors.onPrimary),
            ),
          ),
        ),
      ),
    );
  }
}
