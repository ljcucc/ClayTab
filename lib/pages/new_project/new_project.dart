import 'package:code_playground/pages/new_project/environment_selector.dart';
import 'package:code_playground/pages/new_project/new_project_form.dart';
import 'package:code_playground/pages/new_project/new_project_preview.dart';
import 'package:code_playground/widgets/material_container.dart';
import 'package:flutter/material.dart';

class NewProjectPage extends StatefulWidget {
  const NewProjectPage({
    super.key,
  });

  @override
  State<NewProjectPage> createState() => _NewProjectPageState();
}

class _NewProjectPageState extends State<NewProjectPage> {
  int selectedEnv = 0;

  @override
  Widget build(BuildContext context) {
    final body = [
      NewProjectPreview(),
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
                    EnvironmentSelector(
                      options: [
                        EnvironmentOption(
                          title: "Sketch",
                          description:
                              "Sketch is a simple environment help you to sketch up some ideas.",
                        ),
                        EnvironmentOption(
                          title: "Sandbox",
                          description:
                              "Sandbox is an environemt with some limitation that can works same on all platofrms",
                        ),
                        EnvironmentOption(
                          title: "Native",
                          description:
                              "Native is an environment that uses native operating system resources and commands.",
                        ),
                      ],
                      onSelected: (selected) {
                        setState(() {
                          selectedEnv = selected;
                        });
                      },
                      selected: selectedEnv,
                    ),
                    NewProjectForm(),
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
              onPressed: null,
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
