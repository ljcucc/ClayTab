import 'package:code_playground/pages/editor/compact/compact_editor.dart';
import 'package:code_playground/widgets/touchpad.dart';
import 'package:flutter/material.dart';

class CompactTouchpad extends StatelessWidget {
  final CompactEditorViewState controller;
  final double maxHeight;
  final double minHeight;

  const CompactTouchpad({
    super.key,
    required this.controller,
    this.maxHeight = 210,
    this.minHeight = 160,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      height: controller.onType ? maxHeight : minHeight,
      padding: EdgeInsets.only(top: 4),
      child: GestureDetector(
        onTapDown: (d) {
          controller.onType = true;
        },
        child: Touchpad(
          onClose: () => controller.setState(() {
            controller.toggleToucpad = false;
          }),
        ),
      ),
    );
  }
}
