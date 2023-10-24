import 'package:code_playground/widgets/suggestion_list.dart';
import 'package:code_playground/pages/workspace/compact_workspace/compact_workspace.dart';
import 'package:code_playground/widgets/touchpad.dart';
import 'package:flutter/material.dart';

class MediumTouchpad extends StatelessWidget {
  final CompactLayoutState controller;

  const MediumTouchpad({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      height: controller.onType ? 310 : 200,
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
              child: Touchpad(),
            ),
          ],
        ),
      ),
    );
  }
}
