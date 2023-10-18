import 'dart:io';
import 'package:path/path.dart' as p;

abstract class ProjectData {
  /// Project display name
  final String name;

  /// Project last opened
  final DateTime date;

  ProjectData({
    required this.name,
    required this.date,
  });

  /// Start to construct project data
  void create();

  /// Check the project whether exists
  Future<bool> get exists;
}

class TempProjectData extends ProjectData {
  TempProjectData({
    required super.name,
    required super.date,
  });

  @override
  void create() {}

  @override
  get exists => Future.value(true);
}

class FolderProjectData extends ProjectData {
  /// The directory that project exists
  final Directory path;

  FolderProjectData({
    required super.name,
    required this.path,
    required super.date,
  });

  @override
  void create() {
    path.create();
  }

  @override
  get exists async => path.exists();

  /// create a folder project from directory
  factory FolderProjectData.fromDirectory(Directory folder) {
    return FolderProjectData(
      name: p.basename(folder.path),
      path: folder,
      date: DateTime.fromMillisecondsSinceEpoch(0x0),
    );
  }

  /// create a folder project from a map object (usually from json)
  factory FolderProjectData.fromMap(Map<String, dynamic> map) {
    return FolderProjectData(
      name: map['name'] as String,
      path: Directory(map['path'] as String),
      date: DateTime.fromMillisecondsSinceEpoch(
        int.tryParse(map['date']) ?? 0x0,
      ),
    );
  }

  /// generate a map object (usually for json) from a project
  Map<String, dynamic> get toJson {
    return {
      "name": name,
      "path": path.path,
      "date": date.millisecondsSinceEpoch.toString(),
    };
  }
}
