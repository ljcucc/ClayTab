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
    _externalProjects = ExternalProjects.fromInAppDirectory(inAppDirectory);
    update();
  }

  update() async {
    _projects = [];
    await _internalProjects!.read();
    await _externalProjects!.read();
    _projects.addAll(_internalProjects!.projects);
    _projects.addAll(_externalProjects!.projects);
    notifyListeners();
  }

  /// Open a project directory, add project data to external project list
  open(ProjectData project) async {
    await _externalProjects!.create(project);
    await update();
  }

  get projects {
    return _projects;
  }
}
