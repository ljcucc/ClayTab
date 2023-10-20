import 'package:code_playground/pages/projects/open_project.dart';
import 'package:code_playground/utils/project/project_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:code_playground/pages/projects/projects_layout.dart';
import 'package:code_playground/pages/projects/projects_list.dart';
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

  void openProjectFolder() async {}

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectsProvider>(
      builder: (context, value, child) {
        return ProjectsPageLayout(
          header: Column(
            children: [
              SearchAnchor.bar(
                barHintText: "Search",
                isFullScreen: MediaQuery.of(context).size.width < 600,
                viewElevation: 0,
                barElevation: MaterialStateProperty.resolveWith((states) => 0),
                viewBackgroundColor: Theme.of(context).colorScheme.surface,
                barBackgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Theme.of(context).colorScheme.surface,
                ),
                suggestionsBuilder: (context, controller) => [Text("item")],
                barOverlayColor: MaterialStateProperty.resolveWith(
                    (states) => Theme.of(context).colorScheme.surface),
              ),
              SizedBox(height: 24),
              Container(
                width: double.infinity,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    OpenProjectButton(),
                  ],
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 350),
            child: ProjectsListView(
              projects: value.projects,
            ),
          ),
        );
      },
    );
  }
}
