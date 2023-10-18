import 'package:code_playground/utils/project/project_provider.dart';
import 'package:flutter/material.dart';

import 'package:code_playground/pages/home/home_view.dart';

import 'package:code_playground/pages/new_project/new_project.dart';
import 'package:code_playground/pages/settings.dart';
import 'package:code_playground/pages/workspace/workspace.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final ProjectsProvider _projectsProvider = ProjectsProvider();

  @override
  void initState() {
    super.initState();
    initProjectProvider();
  }

  initProjectProvider() async {
    _projectsProvider.init(await getApplicationDocumentsDirectory());
  }

  onNewProject() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        // fullscreenDialog: true,
        builder: (context) {
          return const NewProjectPage();
        },
      ),
    );

    await _projectsProvider.update();
  }

  openSettings() async {
    await Navigator.of(context).push(MaterialPageRoute(
      fullscreenDialog: false,
      builder: (context) {
        return const SettingsPage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _projectsProvider),
      ],
      child: HomePageView(controller: this),
    );
  }
}
