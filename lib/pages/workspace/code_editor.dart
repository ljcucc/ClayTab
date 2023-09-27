import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:code_playground/components/material_container.dart';

class CodeBlockInfo {
  final String disp;
  final int indent;

  CodeBlockInfo({
    required this.disp,
    required this.indent,
  });
}

class CodeBlock extends StatelessWidget {
  final CodeBlockInfo info;

  const CodeBlock({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 350),
            curve: Curves.easeOutQuart,
            width: 50.0 * info.indent,
          ),
          MaterialContainer(
            elevation: 24,
            borderRadius: BorderRadius.circular(16),
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            surfaceTint: Theme.of(context).colorScheme.primary,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              constraints: BoxConstraints(minWidth: 250),
              // decoration: BoxDecoration(
              //   color: Theme.of(context).colorScheme.surfaceVariant,
              //   borderRadius: BorderRadius.all(Radius.circular(32)),
              // ),
              child: Text(
                info.disp,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      // fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CodeBlockListTile extends StatelessWidget {
  final CodeBlockInfo info;
  final int index;

  const CodeBlockListTile({
    super.key,
    required this.info,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ReorderableDragStartListener(
      index: index,
      child: CodeBlock(
        info: info,
      ),
    );
  }
}

class ReorderableCodes extends StatefulWidget {
  final List<String> strings;
  const ReorderableCodes({
    super.key,
    required this.strings,
  });

  @override
  State<ReorderableCodes> createState() => _ReorderableCodesState();
}

class _ReorderableCodesState extends State<ReorderableCodes> {
  late List<String> _strings;
  @override
  void initState() {
    super.initState();

    _strings = widget.strings;
  }

  @override
  Widget build(BuildContext context) {
    final lines = [
      ...widget.strings.asMap().entries.map((e) {
        return CodeBlockListTile(
          index: e.key,
          info: CodeBlockInfo(
            indent: 0,
            disp: e.value,
          ),
          key: Key("${e.key}"),
        );
      }),
    ];

    Widget proxyDecorator(
        Widget child, int index, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double scale = lerpDouble(1, 1.02, animValue)!;

          return Transform.scale(
            scale: scale,
            child: lines[index],
          );
        },
      );
    }

    return ReorderableListView(
      proxyDecorator: proxyDecorator,
      buildDefaultDragHandles: false,
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final String item = _strings.removeAt(oldIndex);
          _strings.insert(newIndex, item);
        });
      },
      children: lines,
    );
  }
}

class CodeEditor extends StatelessWidget {
  final List<String> code;

  const CodeEditor({
    super.key,
    required this.code,
  });

  Widget line(String e) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Text(
            e,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: ReorderableCodes(
        strings: code,
      ),
    );
  }
}
