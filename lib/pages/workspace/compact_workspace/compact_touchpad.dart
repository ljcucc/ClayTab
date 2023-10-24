import 'package:code_playground/pages/workspace/compact_workspace/compact_workspace.dart';
import 'package:code_playground/widgets/touchpad.dart';
import 'package:flutter/material.dart';

class CompactTouchpad extends StatelessWidget {
  final CompactLayoutState controller;

  const CompactTouchpad({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      height: controller.onType ? 310 : 160,
      padding: EdgeInsets.only(top: 4),
      child: GestureDetector(
        onTapDown: (d) {
          controller.onType = true;
        },
        child: Touchpad(),
      ),
    );
  }
}
