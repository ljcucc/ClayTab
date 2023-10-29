import 'package:code_playground/pages/editor/compact/compact_editor.dart';
import 'package:code_playground/pages/editor/expanded/expanded_editor.dart';
import 'package:flutter/material.dart';

class EditorPage extends StatelessWidget {
  const EditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 840) {
      return CompactEditorView();
    }

    return ExpandedEditorView();
  }
}
