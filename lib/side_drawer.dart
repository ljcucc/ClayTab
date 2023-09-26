import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  final bool open;
  const SideDrawer({
    super.key,
    required this.open,
  });

  @override
  Widget build(BuildContext context) {
    final double width = open ? 316 : 0;
    return AnimatedContainer(
      curve: Curves.easeInOut,
      width: width,
      clipBehavior: Clip.hardEdge,
      duration: const Duration(milliseconds: 3500),
      alignment: Alignment.topRight,
      decoration: BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.all(Radius.circular(32)),
          clipBehavior: Clip.hardEdge,
          shadowColor: Colors.transparent,
          surfaceTintColor: Theme.of(context).colorScheme.primary,
          color: Colors.transparent,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 300,
              child: SizedBox.expand(
                child: Column(
                  children: [
                    Text("hello world"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
