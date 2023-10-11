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
    return GridView.extent(
      padding: EdgeInsets.all(24),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      maxCrossAxisExtent: 500,
      childAspectRatio: 3 / 1,
      children: [
        for (var i = 0; i < 8; i++)
          ProjectTile(
            name: "Project ${i + 1}",
            preview: ProjectPreviewData(
              icon: IconData(0xe000 + math.Random().nextInt(0x0fff),
                  fontFamily: 'MaterialIcons'),
              shape: ProjectPreviewShapes.values[math.Random().nextInt(5)],
              color: math.Random().nextBool()
                  ? null
                  : Color.fromARGB(
                      255,
                      math.Random().nextInt(255),
                      math.Random().nextInt(255),
                      math.Random().nextInt(255),
                    ).harmonizeWith(Theme.of(context).colorScheme.primary),
              // color: Theme.of(context).colorScheme.primary.harmonizeWith(
              //       Color.fromARGB(
              //         255,
              //         math.Random().nextInt(255),
              //         math.Random().nextInt(255),
              //         math.Random().nextInt(255),
              //       ),
              //     ),
            ),
          ),
      ],
    );
  }
}
