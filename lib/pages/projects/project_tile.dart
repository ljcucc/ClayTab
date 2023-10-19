import 'package:code_playground/pages/projects/project_preivew.dart';
import 'package:code_playground/pages/workspace/workspace.dart';
import 'package:code_playground/widgets/shaped_icon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProjectTile extends StatelessWidget {
  final ShapedIconData preview;
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
      width: MediaQuery.of(context).size.width > 600 ? 200 : double.infinity,
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
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => WorkspaceMainLayout(),
            ));
          },
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
