import 'dart:convert';
import 'dart:io';

import 'package:code_playground/utils/project/project.dart';
import 'package:flutter/material.dart';

abstract class Projects {
  List<ProjectData> projects = [];
  Future<void> read();
}

class InternalProjects extends Projects {
  final Directory inAppDirectory;

  InternalProjects({
    required this.inAppDirectory,
  });

  @override
  read() async {
    projects = [];
    await for (FileSystemEntity entry in inAppDirectory.list()) {
      if (entry is! Directory) continue;

      projects.add(
        FolderProjectData.fromDirectory(entry),
      );
    }
  }
}

class ExternalProjects extends Projects {
  final File listfile;

  ExternalProjects({required this.listfile});

  factory ExternalProjects.fromInAppDirectory(Directory inAppDirectory) {
    final file = File('${inAppDirectory.path}/projects.json');
    return ExternalProjects(listfile: file);
  }

  @override
  Future<void> read() async {
    final sourceString = await listfile.readAsString();
    final List<dynamic> jsonList =
        await const JsonDecoder().convert(sourceString);
    projects = jsonList.map((e) => FolderProjectData.fromMap(e)).toList();
  }
}
