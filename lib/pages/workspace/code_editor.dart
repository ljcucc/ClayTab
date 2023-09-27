import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:code_playground/components/material_container.dart';

class CodeBlock extends StatelessWidget {
  final String disp;
  final int index;

  const CodeBlock({
    super.key,
    required this.disp,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ReorderableDragStartListener(
      index: index,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Text(
            disp,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold),
          ),
        ),
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
        return CodeBlock(
          index: e.key,
          disp: e.value,
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
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ReorderableCodes(
          strings: code,
        ),
      ),
    );
  }
}
