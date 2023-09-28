import 'package:code_playground/components/code_editor/parser.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class TokenBlock extends StatelessWidget {
  final String disp;

  const TokenBlock({
    super.key,
    required this.disp,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      padding: const EdgeInsets.all(8),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Text(
        disp,
        style: GoogleFonts.robotoMono(),
      ),
    );
  }
}

class LineWidget extends StatelessWidget {
  final Line line;
  const LineWidget({
    super.key,
    required this.line,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Wrap(
        spacing: 10,
        children: [
          ...line.map((e) {
            return TokenBlock(disp: e);
          }),
        ],
      ),
    );
  }
}

class CodeEditorWidget extends StatelessWidget {
  final LineList lines;
  const CodeEditorWidget({
    super.key,
    required this.lines,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...lines.map((line) {
                return LineWidget(line: line);
              })
            ],
          ),
        ),
      ),
    );
  }
}
