import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
// Import the language & theme
import 'package:highlight/languages/python.dart';
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/solarized-light.dart';
import 'package:flutter_highlight/themes/solarized-dark.dart';
import 'package:flutter_highlight/themes/tomorrow.dart';
import 'package:flutter_highlight/themes/tomorrow-night.dart';

// Google Font
import 'package:google_fonts/google_fonts.dart';

import 'package:dynamic_color/dynamic_color.dart';

class CodeEditor extends StatefulWidget {
  @override
  _CodeEditorState createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  CodeController? _codeController;

  @override
  void initState() {
    super.initState();
    final source = """
""";
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
    final colorScheme = Theme.of(context).colorScheme;
    final theme = Theme.of(context).brightness == Brightness.dark
        ? tomorrowNightTheme
        : tomorrowTheme;

    return SizedBox.expand(
      child: SingleChildScrollView(
        child: CodeTheme(
          data: CodeThemeData(
            styles: theme.map(
              (key, value) {
                var color = value.color;
                var backgroundColor = value.backgroundColor;

                if (value.color != null) {
                  color = color!.harmonizeWith(colorScheme.primary);
                }
                if (key == "root") {
                  backgroundColor = Colors.transparent;
                }
                return MapEntry(
                  key,
                  value.copyWith(
                    color: color,
                    backgroundColor: backgroundColor,
                  ),
                );
              }, // map function
            ), // theme.map
          ),
          child: CodeField(
            controller: _codeController!,
            textStyle: GoogleFonts.robotoMono().copyWith(fontSize: 14),
            smartQuotesType: SmartQuotesType.enabled,
          ),
        ),
      ),
    );
  }
}
