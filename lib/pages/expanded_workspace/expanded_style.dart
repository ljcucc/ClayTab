import 'package:flutter/material.dart';

class ExpandedStyle {
  late final bool haveBorder;
  final double innerElevation;
  final double outterElevation;

  ExpandedStyle({
    this.innerElevation = 0,
    this.outterElevation = 0,
    bool border = false,
  }) {
    this.haveBorder = border;
  }

  BoxBorder? border(color) => haveBorder
      ? Border.all(
          color: color,
          width: 1.5,
        )
      : null;

  factory ExpandedStyle.border() {
    return ExpandedStyle(border: true);
  }

  factory ExpandedStyle.backgroundBorder() {
    return ExpandedStyle(border: true, innerElevation: 2, outterElevation: 2);
  }

  factory ExpandedStyle.inner() {
    return ExpandedStyle(innerElevation: 2);
  }

  factory ExpandedStyle.outter() {
    return ExpandedStyle(outterElevation: 2);
  }
}
