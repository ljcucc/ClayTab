import 'package:code_playground/pages/editor/compact/medium_touchpad.dart';
import 'package:code_playground/pages/editor/compact/compact_touchpad.dart';
import 'package:code_playground/widgets/code_editor/text_editor.dart';
import 'package:code_playground/widgets/material_container.dart';
import 'package:flutter/material.dart';

class CompactEditorView extends StatefulWidget {
  const CompactEditorView({super.key});

  @override
  State<CompactEditorView> createState() => CompactEditorViewState();
}

class CompactEditorViewState extends State<CompactEditorView> {
  bool _onType = true;
  bool get onType => _onType;
  set onType(value) => setState(() {
        // _onType = value;
        _onType = true;
      });

  bool toggleToucpad = false;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    Widget touchpad = Container();

    if (toggleToucpad) {
      if (MediaQuery.of(context).orientation == Orientation.portrait) {
        touchpad = deviceWidth > 580
            ? MediumTouchpad(controller: this)
            : CompactTouchpad(controller: this);
      }
    }

    final animatedTouchpadZone = AnimatedSize(
      duration: Duration(milliseconds: 150),
      curve: Curves.easeInOutCubic,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 150),
        child: touchpad,
        transitionBuilder: (child, animation) {
          Tween<double> scale = new Tween<double>(begin: 0.95, end: 1);
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation.drive(scale),
              child: child,
            ),
          );
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Container(),
      ),
      floatingActionButton: toggleToucpad
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                key: Key("pad"),
                elevation: 0,
                child: Icon(Icons.gamepad_outlined),
                onPressed: () {
                  setState(() {
                    toggleToucpad = true;
                  });
                },
              ),
            ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(vertical: 32, horizontal: 0)
            .copyWith(bottom: 8, top: 0),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTapDown: (detials) {
                  onType = false;
                },
                child: SafeArea(
                  minimum: EdgeInsets.symmetric(horizontal: 12),
                  child: MaterialContainer(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(24),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    child: CodeEditor(),
                  ),
                ),
              ),
            ),
            animatedTouchpadZone,
          ],
        ),
      ),
    );
  }
}
