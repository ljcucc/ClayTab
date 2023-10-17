import 'dart:math';

import 'package:code_playground/pages/projects/project_preivew.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

class ProjectTile extends StatelessWidget {
  final ProjectPreviewData preview;
  final String name;

  const ProjectTile({
    super.key,
    required this.name,
    required this.preview,
  });

  @override
  Widget build(BuildContext context) {
    final tileColorScheme = preview.color != null
        ? ColorScheme.fromSeed(
            seedColor: preview.color!,
            brightness: Theme.of(context).colorScheme.brightness,
          )
        : Theme.of(context).colorScheme;

    return SizedBox(
      width: 200,
      height: MediaQuery.of(context).size.width > 600 ? 200 : null,
      child: Card(
        // color: tileColorScheme.primaryContainer,
        elevation: 0,
        shadowColor: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              if (MediaQuery.of(context).size.width > 600)
                Expanded(
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ProjectPreview(
                      colorScheme: tileColorScheme,
                      preview: preview,
                    ),
                  ),
                ),
              ListTile(
                leading: Icon(
                  Icons.folder_open,
                  size: 20,
                ),
                title: Text(
                  name,
                  style: TextStyle(color: tileColorScheme.onSurface),
                ),
                // subtitle: Text("Sunday"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
