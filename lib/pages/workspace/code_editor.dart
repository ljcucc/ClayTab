import 'package:flutter/material.dart';
import 'package:code_playground/components/material_container.dart';

class CodeEditor extends StatelessWidget {
  final List<String> code;

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
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            // spacing: 8,
            // runSpacing: 16,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...code.map((e) {
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
