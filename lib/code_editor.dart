import 'package:flutter/material.dart';

class CodeEditor extends StatelessWidget {
  final String code;

  const CodeEditor({
    super.key,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            // mainAxisSize: MainAxisSize.min,
            spacing: 8,
            runSpacing: 16,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...code
                  .split(RegExp("\\s|\\n|\\t"))
                  .where((element) => element.trim().length > 0)
                  .toList()
                  .map((e) {
                return Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Text(
                      e,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
