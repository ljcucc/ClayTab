import 'package:code_playground/pages/editor/compact/compact_editor.dart';
import 'package:code_playground/widgets/suggestion_list.dart';
import 'package:code_playground/pages/workspace/compact_workspace/compact_workspace.dart';
import 'package:code_playground/widgets/touchpad.dart';
import 'package:flutter/material.dart';

class MediumTouchpad extends StatelessWidget {
  final CompactEditorViewState controller;
  final double maxHeight;
  final double minHeight;

  const MediumTouchpad({
    super.key,
    required this.controller,
    this.maxHeight = 310,
    this.minHeight = 200,
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
        child: Row(
          children: [
            Flexible(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SuggestionList(),
            )),
            Flexible(
              child: Touchpad(
                onClose: () => controller.setState(() {
                  controller.toggleToucpad = false;
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
