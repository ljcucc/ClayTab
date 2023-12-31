import 'package:code_playground/pages/projects/project_preivew.dart';
import 'package:code_playground/pages/workspace/workspace.dart';
import 'package:code_playground/utils/project/project.dart';
import 'package:code_playground/widgets/shaped_icon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProjectTile extends StatelessWidget {
  final ProjectData project;
  final ShapedIconData preview;
  final String name;

  const ProjectTile({
    super.key,
    required this.project,
    required this.name,
    required this.preview,
  });

  void openWorkspace() {}

  @override
  Widget build(BuildContext context) {
    final tileColorScheme = preview.color != null
        ? ColorScheme.fromSeed(
            seedColor: preview.color!,
            brightness: Theme.of(context).colorScheme.brightness,
          )
        : Theme.of(context).colorScheme;

    return SizedBox(
      width: MediaQuery.of(context).size.width > 600 ? 200 : double.infinity,
      height: MediaQuery.of(context).size.width > 600 ? 200 : null,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        shadowColor: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => WorkspaceMainLayout(
                project: project,
              ),
            ));
          },
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ProjectPreview(
                      colorScheme: tileColorScheme,
                      preview: preview,
                    ),
                  ),
                ),
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16).copyWith(right: 8),
                leading: Icon(
                  Icons.folder_open,
                  size: 20,
                ),
                title: Text(
                  name,
                  style: TextStyle(color: tileColorScheme.onSurface),
                  maxLines: 1,
                ),
                subtitle: Text(
                  DateFormat("MMM dd, yyyy").format(DateTime.now()),
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimaryContainer
                            .withOpacity(.5),
                      ),
                  maxLines: 1,
                ),
                trailing: IconButton(
                  iconSize: 20,
                  icon: Icon(
                    Icons.more_vert,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(.65),
                  ),
                  onPressed: () {},
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
