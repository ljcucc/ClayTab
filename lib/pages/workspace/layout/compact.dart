import 'package:code_playground/components/material_container.dart';
import 'package:code_playground/components/touchpad.dart';
import 'package:flutter/material.dart';

class CompactTouchpad extends StatelessWidget {
  const CompactTouchpad({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Flexible(
        //   flex: 1,
        //   child: Container(),
        // ),
        Flexible(
          flex: 1,
          child: Touchpad(),
        ),
      ],
    );
  }
}

class CompactLayout extends StatefulWidget {
  final Widget body;

  const CompactLayout({
    super.key,
    required this.body,
  });

  @override
  State<CompactLayout> createState() => _CompactLayoutState();
}

class _CompactLayoutState extends State<CompactLayout> {
  bool onType = false;

  @override
  Widget build(BuildContext context) {
    return MaterialContainer(
      borderRadius: BorderRadius.zero,
      elevation: 12,
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        minimum: EdgeInsets.symmetric(vertical: 32, horizontal: 0)
            .copyWith(bottom: 8),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTapDown: (detials) {
                  setState(() {
                    onType = false;
                  });
                },
                child: MaterialContainer(
                  elevation: 0,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  child: widget.body,
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 600),
              curve: Curves.easeOutQuint,
              height: onType ? 310 : 160,
              padding: EdgeInsets.only(top: 4),
              child: GestureDetector(
                onTapDown: (d) {
                  setState(() {
                    onType = true;
                  });
                },
                child: CompactTouchpad(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
