import 'package:code_playground/components/material_container.dart';
import 'package:flutter/material.dart';

class DirectionButton extends StatelessWidget {
  final Widget icon;

  const DirectionButton({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(400),
          color: Theme.of(context).colorScheme.primary.withOpacity(.15)),
      child: InkWell(
        onTap: () {},
        child: Container(
          constraints: BoxConstraints.expand(),
          padding: EdgeInsets.all(16),
          child: icon,
        ),
      ),
    );
  }
}

class DirectionButtonsGroup extends StatelessWidget {
  const DirectionButtonsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      // width: double.infinity,
      child: MaterialContainer(
        // backgroundColor: theme.surface,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Column(
              children: [
                Flexible(
                  flex: 12,
                  child: DirectionButton(
                    icon: Icon(Icons.keyboard_arrow_up),
                  ),
                ),
                SizedBox(height: 8),
                Flexible(
                    flex: 12,
                    child: DirectionButton(
                      icon: Icon(Icons.keyboard_arrow_down),
                    )),
                SizedBox(height: 8),
                Flexible(
                  flex: 15,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: DirectionButton(
                          icon: Icon(Icons.first_page),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        flex: 1,
                        child: DirectionButton(
                          icon: Icon(Icons.last_page),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Touchpad extends StatelessWidget {
  const Touchpad({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: DirectionButtonsGroup(),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   // child: Text("hello fdhsaklfhdjklas"),
          // ),
        ],
      ),
    );
  }
}

class FloatingTouchpadLayer extends StatelessWidget {
  const FloatingTouchpadLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(36),
      child: MaterialContainer(
        elevation: 0,
        // backgroundColor: Theme.of(context).colorScheme.surface,
        child: Container(
          height: 300,
          width: 250,
          child: Touchpad(),
        ),
      ),
    );
  }
}
