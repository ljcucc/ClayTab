import 'package:flutter/material.dart';

class EnvironmentOption {
  final String title;
  final String description;

  EnvironmentOption({
    required this.title,
    required this.description,
  });
}

class EnvironmentOptionView extends StatelessWidget {
  final String title;
  final String description;
  final bool selected;
  final VoidCallback onTap;

  const EnvironmentOptionView({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.outline;

    final surface = selected
        ? Theme.of(context).colorScheme.primaryContainer.withOpacity(.35)
        : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        height: 140,
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: surface,
                border: Border.all(width: selected ? 2 : 1, color: color),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: color),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: color),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EnvironmentSelector extends StatelessWidget {
  final List<EnvironmentOption> options;
  final Function(int) onSelected;
  final int selected;

  const EnvironmentSelector({
    super.key,
    required this.onSelected,
    required this.selected,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Environment",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 32),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < options.length; i++)
                    EnvironmentOptionView(
                      title: options[i].title,
                      description: options[i].description,
                      selected: selected == i,
                      onTap: () {
                        onSelected(i);
                      },
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
