import 'dart:math';

import 'package:flutter/material.dart';

class ProjectPreviewData {
  final IconData icon;
  final Color? color;
  final ProjectPreviewShapes? shape;

  ProjectPreviewData({
    required this.icon,
    this.color,
    this.shape,
  });
}

enum ProjectPreviewShapes {
  Circle,
  Scallop,
  Clover,
  Drop,
  Rect,
}

class ProjectPreviewShape extends StatelessWidget {
  final Widget child;
  final Color color;
  final ProjectPreviewShapes shape;

  const ProjectPreviewShape({
    super.key,
    required this.child,
    required this.color,
    required this.shape,
  });

  @override
  Widget build(BuildContext context) {
    Decoration decoration =
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(32));

    switch (shape) {
      case ProjectPreviewShapes.Scallop:
        decoration = ShapeDecoration(
          color: color,
          shape: StarBorder(
            points: 8,
            innerRadiusRatio: 0.75,
            valleyRounding: 0.5,
            pointRounding: 0.5,
          ),
        );
        break;
      case ProjectPreviewShapes.Circle:
        decoration = BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(1000),
        );
        break;
      case ProjectPreviewShapes.Clover:
        decoration = ShapeDecoration(
          color: color,
          shape: StarBorder(
            points: 4,
            rotation: 45,
            innerRadiusRatio: 0.5,
            valleyRounding: 0.25,
            pointRounding: 0.75,
          ),
        );
        break;
      case ProjectPreviewShapes.Drop:
      // TODO: Handle this case.
      case ProjectPreviewShapes.Rect:
        break;
    }

    return Container(
      decoration: decoration,
      child: child,
    );
  }
}

class ProjectPreview extends StatelessWidget {
  final ColorScheme? colorScheme;
  final ProjectPreviewData preview;

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
            child: ProjectPreviewShape(
              shape: preview.shape ?? ProjectPreviewShapes.Clover,
              color: colors.primary,
              child: Icon(preview.icon, size: 32, color: colors.onPrimary),
            ),
          ),
        ),
      ),
    );
  }
}
