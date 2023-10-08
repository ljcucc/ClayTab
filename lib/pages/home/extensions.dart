import 'package:flutter/material.dart';

class ExtensionsPage extends StatelessWidget {
  const ExtensionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(32).copyWith(bottom: 0),
      child: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "Extensions",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Placeholder(),
            ],
          ),
        ),
      ),
    );
  }
}
