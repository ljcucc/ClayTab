import 'package:code_playground/components/code_editor/editor.dart';
import 'package:code_playground/pages/workspace/layout/compact.dart';
import 'package:code_playground/pages/workspace/layout/expanded.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final body = CodeEditorWidget(
      lines: [
        ["function", "(", "e", ")", "{"],
        ["console", ".", "log", "(", '"hello world"', ")"],
        ["}"],
      ],
    );

    if (width < 600) {
      return CompactLayout(
        body: body,
      );
    }

    return ExpandedLayout(
      body: body,
    );
  }
}
