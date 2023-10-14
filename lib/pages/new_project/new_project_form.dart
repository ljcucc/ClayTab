import 'package:flutter/material.dart';

class ProjectFormField extends StatelessWidget {
  final String title;
  final String? hint;

  const ProjectFormField({
    super.key,
    required this.title,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: hint,
                label: Text(title),
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
        ),
      ],
    );
  }
}

class NewProjectForm extends StatelessWidget {
  const NewProjectForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Project",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                ProjectFormField(title: "Name"),
                ProjectFormField(
                  title: "Folder",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
