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
        LineInfo(indent: 0, list: [
          TokenInfo(code: "function"),
          TokenInfo(code: "main"),
          TokenInfo(code: "("),
          TokenInfo(code: "args"),
          TokenInfo(code: ")"),
          TokenInfo(code: "{"),
        ]),
        LineInfo(indent: 1, list: [
          TokenInfo(code: "console"),
          TokenInfo(code: "."),
          TokenInfo(code: "log"),
          TokenInfo(code: "("),
          TokenInfo(code: "\"hello world\""),
          TokenInfo(code: ")"),
          TokenInfo(code: ";"),
        ]),
        LineInfo(indent: 0, list: [
          TokenInfo(code: "}"),
        ]),
      ],
    );

    if (width < 600) {
      return CompactLayout(
        body: body,
      );
    }

    return ExpandedLayout(
      body: body,
      // backgroundImage: NetworkImage(
      //   "https://materia.press/wp-content/uploads/2022/03/BRIAN-THOREEN-40-scaled.jpg",
      // ),
    );
  }
}
