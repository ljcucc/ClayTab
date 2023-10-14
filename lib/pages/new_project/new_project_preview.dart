import 'package:code_playground/pages/projects_section/project_preivew.dart';
import 'package:flutter/material.dart';

class NewProjectPreview extends StatelessWidget {
  const NewProjectPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Center(
        child: SizedBox(
          width: 150,
          child: ProjectPreviewShape(
            color: Theme.of(context).colorScheme.primary,
            child: Icon(
              Icons.android,
              size: 48,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            shape: ProjectPreviewShapes.Scallop,
          ),
        ),
      ),
    );
  }
}
