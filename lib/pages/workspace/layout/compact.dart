import 'package:code_playground/components/material_container.dart';
import 'package:code_playground/components/touchpad.dart';
import 'package:flutter/material.dart';

class CompactTouchpad extends StatelessWidget {
  const CompactTouchpad({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Flexible(
          flex: 1,
          child: Touchpad(),
        ),
      ],
    );
  }
}

class CompactLayout extends StatelessWidget {
  final Widget body;

  const CompactLayout({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialContainer(
      borderRadius: BorderRadius.zero,
      elevation: 12,
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        minimum: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: MaterialContainer(
                elevation: 0,
                backgroundColor: Theme.of(context).colorScheme.surface,
                child: body,
              ),
            ),
            Container(
              height: 220,
              padding: EdgeInsets.only(top: 16),
              child: CompactTouchpad(),
            ),
          ],
        ),
      ),
    );
  }
}
