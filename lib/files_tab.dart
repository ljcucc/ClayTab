import 'package:flutter/material.dart';

class FilesTab extends StatefulWidget {
  final List<String> files;

  const FilesTab({
    super.key,
    required this.files,
  });

  @override
  State<FilesTab> createState() => _FilesTabState();
}

class _FilesTabState extends State<FilesTab> {
  int cur = -1;
  List<Widget> generate(List<String> list) {
    return list.asMap().entries.map((entry) {
      final onPressed = () {
        setState(() {
          cur = entry.key;
        });
      };
      ButtonStyle? style = ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Theme.of(context).colorScheme.surfaceVariant,
        ),
      );
      final child = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(entry.value),
      );
      if (entry.key != cur) {
        style = null;
      }
      return Padding(
        padding: const EdgeInsets.only(right: 4),
        child: SizedBox(
          child: TextButton(
            onPressed: onPressed,
            child: child,
            style: style,
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 8),
      child: Row(
        children: generate(widget.files),
      ),
    );
  }
}
