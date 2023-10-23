import 'package:code_playground/pages/projects/project_tile.dart';
import 'package:code_playground/widgets/shaped_icon.dart';
import 'package:flutter/material.dart';

import 'package:code_playground/utils/project/project.dart';
import 'package:code_playground/utils/project/project_list.dart';

class ProjectsListView extends StatelessWidget {
  final List<ProjectData> projects;
  final Widget? header;

  const ProjectsListView({
    super.key,
    required this.projects,
    this.header,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      final crossAxisCount = (constrain.maxWidth.round() / 280).round();

      return SizedBox.expand(
        child: Column(
          children: [
            header ?? Container(),
            Expanded(
              child: GridView.builder(
                padding:
                    EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 24),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // maxCrossAxisExtent: 280,
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: crossAxisCount == 1 ? 3 / 2 : 1,
                ),
                itemBuilder: (context, index) {
                  final data = projects[index];
                  return ProjectTile(
                    project: projects[index],
                    name: data.name,
                    preview: ShapedIconData(
                      shape: ShapeTypes.Scallop,
                      icon: Icons.code,
                    ),
                  );
                },
                itemCount: projects.length,
              ),
            ),
          ],
        ),
      );
    });
  }
}
