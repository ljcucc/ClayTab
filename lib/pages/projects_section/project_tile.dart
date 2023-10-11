import 'dart:math';

import 'package:code_playground/pages/projects_section/project_preivew.dart';
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

    return Card(
      color: tileColorScheme.primaryContainer,
      shadowColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        // side: BorderSide(color: tileColorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(32),
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.all(0),
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
            ),
            Expanded(
                child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              title: Text(
                name,
                style: TextStyle(color: tileColorScheme.onSurface),
              ),
              subtitle: Text("Sunday"),
            ))
          ],
        ),
      ),
    );
  }
}
