import 'package:code_playground/components/code_editor/parser.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class LinePosition {
  final int line;
  final int index;
  const LinePosition({
    required this.line,
    required this.index,
  });
}

class TokenInfo {
  LinePosition? pos;
  String code;

  TokenInfo({
    this.pos,
    required this.code,
  });

  get disp => code;
}

class TokenBlock extends StatelessWidget {
  final TokenInfo info;

  const TokenBlock({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      padding: const EdgeInsets.all(8),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(.45),
      ),
      child: Text(
        info.disp,
        style: GoogleFonts.robotoMono().copyWith(fontSize: 12),
      ),
    );
  }
}

class LineWidget extends StatelessWidget {
  final int linenumber;
  final Line line;

  const LineWidget({
    super.key,
    required this.line,
    required this.linenumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Wrap(
        spacing: 4,
        runSpacing: 4,
        children: [
          ...line.map((e) {
            return TokenBlock(
              info: TokenInfo(code: e),
            );
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
              for (var i = 0; i < lines.length; i++)
                LineWidget(
                  line: lines[i],
                  linenumber: i,
                )
            ],
          ),
        ),
      ),
    );
  }
}
