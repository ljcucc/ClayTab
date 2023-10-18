import 'dart:io';

import 'package:code_playground/utils/project/project.dart';
import 'package:code_playground/utils/project/project_list.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ProjectsProvider extends ChangeNotifier {
  InternalProjects? _internalProjects;
  ExternalProjects? _externalProjects;

  List<ProjectData> _projects = [];

  init(Directory inAppDirectory) {
    _internalProjects = InternalProjects(inAppDirectory: inAppDirectory);
    update();
  }

  update() async {
    _projects = [];
    await _internalProjects!.read();
    _projects.addAll(_internalProjects!.projects);
    notifyListeners();
  }

  get projects {
    return _projects;
  }
}
