import 'dart:io';

import 'package:code_playground/utils/project/project.dart';
import 'package:code_playground/utils/project/project_list.dart';
import 'package:code_playground/utils/project/project_provider.dart';
import 'package:flutter/material.dart';
import 'package:code_playground/pages/new_project/new_project_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class NewProjectPage extends StatefulWidget {
  const NewProjectPage({
    super.key,
  });

  @override
  State<NewProjectPage> createState() => NewProjectPageState();
}

class NewProjectPageState extends State<NewProjectPage> {
  int selectedEnv = 0;
  String name = "";

  onEnvSelected(int selected) {
    setState(() {
      selectedEnv = selected;
    });
  }

  onNameChanged(name) {
    this.name = name;
  }

  onDone() async {
    final inAppDirectory = await getApplicationDocumentsDirectory();
    final newWorkspace = Directory("${inAppDirectory.path}/$name");
    final project = FolderProjectData.fromDirectory(newWorkspace);
    project.create();

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return NewProjectPageView(controller: this);
  }
}
