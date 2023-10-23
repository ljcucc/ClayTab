import 'package:flutter/material.dart';

class ProjectSearchView extends StatelessWidget {
  const ProjectSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
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
    );
  }
}
