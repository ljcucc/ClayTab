import 'package:code_playground/pages/new_project/environment_selector.dart';
import 'package:code_playground/pages/new_project/new_project.dart';
import 'package:code_playground/pages/new_project/new_project_form.dart';
import 'package:code_playground/pages/new_project/new_project_preview.dart';
import 'package:code_playground/widgets/material_container.dart';
import 'package:code_playground/widgets/shaped_icon.dart';
import 'package:flutter/material.dart';

class NewProjectPageView extends StatelessWidget {
  final NewProjectPageState controller;

  const NewProjectPageView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final environmentSelector = EnvironmentSelector(
      options: [
        EnvironmentOption(
          title: "Internal",
          description:
              "Create a blank project inside application folder. You'll need to export and import if you're using android or iOS.",
        ),
        EnvironmentOption(
          title: "External",
          description:
              "Create a blank project outside application, which will ask your workspace folder, or create in shared folder.",
        ),
        EnvironmentOption(
          title: "Open Existing",
          description: "Open the existing folder on your disk.",
        ),
      ],
      onSelected: controller.onEnvSelected,
      selected: controller.selectedEnv,
    );

    final shape = ShapeTypes.values[controller.selectedEnv];

    final body = [
      NewProjectPreview(
        shape: shape,
      ),
      SizedBox(
        height: 24,
        width: 24,
      ),
      Expanded(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: MaterialContainer(
            borderRadius: BorderRadius.circular(24)
                .copyWith(bottomLeft: Radius.zero, bottomRight: Radius.zero),
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    environmentSelector,
                    NewProjectForm(
                      onNameChanged: controller.onNameChanged,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ];

    return MaterialContainer(
      elevation: 2,
      borderRadius: BorderRadius.zero,
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          forceMaterialTransparency: true,
          backgroundColor: Colors.transparent,
          title: Text("New Project"),
          centerTitle: false,
          actions: [
            TextButton(
              onPressed: controller.onDone,
              child: Text("Done"),
            )
          ],
        ),
        body: MediaQuery.of(context).size.width > 600
            ? Row(children: body)
            : Column(children: body),
      ),
    );
  }
}
