import 'dart:io';

import 'package:code_playground/utils/project/project.dart';
import 'package:code_playground/utils/project/project_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OpenProjectButton extends StatefulWidget {
  const OpenProjectButton({super.key});

  @override
  State<OpenProjectButton> createState() => _OpenProjectButtonState();
}

class _OpenProjectButtonState extends State<OpenProjectButton> {
  void openProjectFolder() async {
    final result = await FilePicker.platform.getDirectoryPath();
    if (result == null) return;
    final project = FolderProjectData.fromDirectory(Directory(result));
    final projectProvider =
        Provider.of<ProjectsProvider>(context, listen: false);
    await projectProvider.open(project);
  }

  @override
  Widget build(BuildContext context) {
    var label = "Open Folder";
    if (MediaQuery.of(context).size.width < 600) {
      label = "Open";
    }

    return FloatingActionButton.extended(
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      elevation: 0,
      onPressed: openProjectFolder,
      icon: Icon(Icons.file_open_outlined),
      label: Text(label),
    );
  }
}
