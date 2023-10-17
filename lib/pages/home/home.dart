import 'package:flutter/material.dart';

import 'package:code_playground/pages/home/home_view.dart';

import 'package:code_playground/pages/new_project/new_project.dart';
import 'package:code_playground/pages/settings.dart';
import 'package:code_playground/pages/workspace/workspace.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  onNewProject() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        // fullscreenDialog: true,
        builder: (context) {
          return const NewProjectPage();
        },
      ),
    );

    await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return const WorkspaceMainLayout();
        },
      ),
    );
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
    return HomePageView(controller: this);
  }
}
