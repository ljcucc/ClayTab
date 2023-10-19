import 'package:code_playground/pages/projects/project_tile.dart';
import 'package:code_playground/widgets/shaped_icon.dart';
import 'package:flutter/material.dart';

import 'package:code_playground/utils/project/project.dart';
import 'package:code_playground/utils/project/project_list.dart';

class ProjectsList extends StatefulWidget {
  final List<ProjectData> projects;
  final Widget? header;

  const ProjectsList({
    super.key,
    required this.projects,
    this.header,
  });

  @override
  State<ProjectsList> createState() => _ProjectsListState();
}

class _ProjectsListState extends State<ProjectsList> {
  Projects? projectList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProjectsListView(controller: this);
  }
}

class ProjectsListView extends StatelessWidget {
  final _ProjectsListState controller;

  const ProjectsListView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final double gap = MediaQuery.of(context).size.width > 600 ? 16 : 0;
    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.widget.header ?? Container(),
                Wrap(
                  runSpacing: gap,
                  spacing: gap,
                  children: [
                    for (ProjectData data in controller.widget.projects)
                      ProjectTile(
                        name: data.name,
                        preview: ShapedIconData(
                          shape: ShapeTypes.Scallop,
                          icon: Icons.code,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
