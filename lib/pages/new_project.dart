import 'package:code_playground/widgets/material_container.dart';
import 'package:flutter/material.dart';

class NewProjectPage extends StatelessWidget {
  const NewProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialContainer(
      elevation: 0,
      borderRadius: BorderRadius.zero,
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: null,
              child: Text("Done"),
            )
          ],
        ),
        body: Container(),
      ),
    );
  }
}
