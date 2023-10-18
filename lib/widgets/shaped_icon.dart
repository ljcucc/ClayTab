import 'package:flutter/material.dart';

class ShapedIconData {
  final IconData icon;
  final Color? color;
  final ShapeTypes? shape;

  ShapedIconData({
    required this.icon,
    this.color,
    this.shape,
  });
}

enum ShapeTypes {
  Scallop,
  Clover,
  Rect,
  Circle,
  Drop,
}

class ShapedIcon extends StatelessWidget {
  final Widget child;
  final Color color;
  final ShapeTypes shape;

  const ShapedIcon({
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
      case ShapeTypes.Scallop:
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
      case ShapeTypes.Circle:
        decoration = BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(1000),
        );
        break;
      case ShapeTypes.Clover:
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
      case ShapeTypes.Drop:
        decoration = BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100).copyWith(
            topLeft: Radius.circular(32),
          ),
        );
      case ShapeTypes.Rect:
        break;
    }

    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: decoration,
        child: child,
      ),
    );
  }
}
