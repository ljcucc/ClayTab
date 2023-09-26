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
          Theme.of(context).colorScheme.primary.withOpacity(.15),
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
          child: TextButton.icon(
            icon: Icon(Icons.info_outline),
            onPressed: onPressed,
            label: child,
            style: style,
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        constraints: const BoxConstraints(maxWidth: 500),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: generate(widget.files),
          ),
        ),
      ),
    );
  }
}
