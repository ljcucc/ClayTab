import 'package:code_playground/pages/expanded_workspace/expanded_style.dart';
import 'package:code_playground/widgets/code_editor/text_editor.dart';
import 'package:code_playground/widgets/code_editor/block/editor.dart';
import 'package:code_playground/pages/workspace/layout/compact.dart';
import 'package:code_playground/pages/expanded_workspace/expanded_workspace.dart';
import 'package:flutter/material.dart';

class WorkspaceMainLayout extends StatelessWidget {
  const WorkspaceMainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final body = CodeEditorWidget(
      lines: [],
    );

    if (width < 600) {
      return CompactLayout(
        body: body,
      );
    }

    // TODO: Write ExpandedStyle into a provider widget

    // backgroundImage: NetworkImage(
    //   "https://materia.press/wp-content/uploads/2022/03/BRIAN-THOREEN-40-scaled.jpg",
    // ),
    );

    return ExpandedWorkspace();
  }
}
