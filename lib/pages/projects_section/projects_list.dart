import 'package:code_playground/pages/projects_section/project_preivew.dart';
import 'package:code_playground/pages/projects_section/project_tile.dart';
import 'package:code_playground/widgets/material_container.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProjectsList extends StatelessWidget {
  const ProjectsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Wrap(
            runSpacing: 16,
            spacing: 16,
            children: [
              ProjectTile(
                name: "CodeSandbox",
                preview: ProjectPreviewData(
                  shape: ProjectPreviewShapes.Scallop,
                  icon: Icons.code,
                ),
              ),
              ProjectTile(
                name: "Hello World",
                preview: ProjectPreviewData(
                  shape: ProjectPreviewShapes.Rect,
                  icon: Icons.waving_hand_outlined,
                ),
              ),
              ProjectTile(
                name: "New Project",
                preview: ProjectPreviewData(
                  shape: ProjectPreviewShapes.Clover,
                  icon: Icons.android,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
