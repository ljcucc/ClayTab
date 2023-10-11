import 'package:code_playground/pages/projects_section/projects_list.dart';
import 'package:code_playground/widgets/material_container.dart';
import 'package:flutter/material.dart';

// StatfulWidget Wrapper
class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  @override
  Widget build(BuildContext context) {
    return ProjectsSectionView(
      child: ProjectsList(),
    );
  }
}

// Stateless View Widget
class ProjectsSectionView extends StatelessWidget {
  final Widget child;
  const ProjectsSectionView({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(24).copyWith(bottom: 0, top: 32),
      child: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 24),
              child: Text(
                "Projects",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: MaterialContainer(
                elevation: 0,
                borderRadius: BorderRadius.circular(24).copyWith(
                    bottomLeft: Radius.zero, bottomRight: Radius.zero),
                backgroundColor: Theme.of(context).colorScheme.surface,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
