import 'package:flutter/material.dart';

class ProjectFormField extends StatelessWidget {
  final String title;
  final String? hint;
  final Function(String value) onChange;

  const ProjectFormField({
    super.key,
    required this.title,
    this.hint,
    required this.onChange,
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
              // floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            onChanged: onChange,
          ),
        ),
      ],
    );
  }
}

class NewProjectForm extends StatelessWidget {
  final Function(String name) onNameChanged;
  const NewProjectForm({
    super.key,
    required this.onNameChanged,
  });

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
            SizedBox(height: 32),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                ProjectFormField(
                  title: "Name",
                  onChange: onNameChanged,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
