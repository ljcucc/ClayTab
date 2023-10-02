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

class LineInfo {
  final int indent;
  final List<TokenInfo> list;

  LineInfo({
    required this.indent,
    required this.list,
  });
}

class IndentBlock extends StatelessWidget {
  const IndentBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primaryContainer;

    return Container(
      // clipBehavior: Clip.hardEdge,
      // decoration: BoxDecoration(
      //   border: Border(
      //     left: BorderSide(color: color, width: 8),
      //   ),
      // ),
      width: 30,
      child: Text(
        " ",
        style: GoogleFonts.robotoMono().copyWith(fontSize: 14),
      ),
    );
  }
}

class TokenBlock extends StatefulWidget {
  final TokenInfo info;

  const TokenBlock({
    super.key,
    required this.info,
  });

  @override
  State<TokenBlock> createState() => _TokenBlockState();
}

class _TokenBlockState extends State<TokenBlock> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primaryContainer;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: MouseRegion(
        onHover: (e) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (e) {
          setState(() {
            _isHovered = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 50),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: color,
            boxShadow: [
              BoxShadow(
                color: color,
                offset: Offset(4, 0),
                blurRadius: 0,
              ),
            ],
          ),
          child: Text(
            widget.info.disp,
            style: GoogleFonts.robotoMono().copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }
}

class LineWidget extends StatelessWidget {
  final int linenumber;
  final LineInfo line;

  const LineWidget({
    super.key,
    required this.line,
    required this.linenumber,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // spacing: 4,
      // runSpacing: 2,
      children: [
        // Indents
        for (int i = 0; i < line.indent; i++) IndentBlock(),

        // Tokens
        ...line.list.map((token) {
          return TokenBlock(
            info: TokenInfo(code: token.disp),
          );
        }),
      ],
    );
  }
}

class CodeEditorWidget extends StatelessWidget {
  final List<LineInfo> lines;
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
