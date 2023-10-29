import 'package:code_playground/widgets/code_editor/text_editor.dart';
import 'package:code_playground/widgets/material_container.dart';
import 'package:code_playground/widgets/suggestion_list.dart';
import 'package:code_playground/widgets/touchpad.dart';
import 'package:flutter/material.dart';

class ExpandedEditorView extends StatelessWidget {
  const ExpandedEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Row(
          children: [
            Flexible(
              flex: 5,
              child: MaterialContainer(
                backgroundColor: colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
                elevation: 2,
                child: CodeEditor(),
              ),
            ),
            SizedBox(width: 16),
            SizedBox(
              width: 300,
              child: LayoutBuilder(builder: (context, constrains) {
                return Column(
                  children: [
                    Expanded(
                      child: SuggestionList(),
                    ),
                    if (constrains.maxHeight > 450) ...[
                      SizedBox(height: 8),
                      SizedBox(
                        height: 300,
                        child: Touchpad(),
                      ),
                    ]
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
