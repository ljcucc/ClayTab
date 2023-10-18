import 'package:code_playground/utils/project/project_provider.dart';
import 'package:flutter/material.dart';
import "package:path_provider/path_provider.dart";

import 'package:code_playground/pages/projects/projects_layout.dart';
import 'package:code_playground/pages/projects/projects_list.dart';
import 'package:code_playground/utils/project/project_list.dart';
import 'package:code_playground/utils/project/project.dart';
import 'package:provider/provider.dart';

// StatfulWidget Wrapper
class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  List<ProjectData> projects = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectsProvider>(
      builder: (context, value, child) {
        return ProjectsPageLayout(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 350),
            child: ProjectsList(
              projects: value.projects,
            ),
          ),
        );
      },
    );
  }
}
