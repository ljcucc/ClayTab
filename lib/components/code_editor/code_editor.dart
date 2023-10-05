import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
// Import the language & theme
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/vs.dart';

// Google Font
import 'package:google_fonts/google_fonts.dart';

class CodeEditor extends StatefulWidget {
  @override
  _CodeEditorState createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  CodeController? _codeController;

  @override
  void initState() {
    super.initState();
    final source = "void main() {\n    print(\"Hello, world!\");\n}";
    // Instantiate the CodeController
    _codeController = CodeController(
      text: source,
      language: dart,
    );
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CodeTheme(
      data: const CodeThemeData(styles: vsTheme),
      child: CodeField(
        controller: _codeController!,
        textStyle: GoogleFonts.robotoMono().copyWith(fontSize: 14),
      ),
    );
  }
}
