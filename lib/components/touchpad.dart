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
        borderRadius: BorderRadius.circular(400),
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
        backgroundColor: theme.surface,
        elevation: 4,
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
                SizedBox(height: 8),
                Flexible(
                  flex: 8,
                  child: DirectionButton(
                    icon: Icon(Icons.keyboard_arrow_up),
                  ),
                ),
                SizedBox(height: 8),
                Flexible(
                    flex: 8,
                    child: DirectionButton(
                      icon: Icon(Icons.keyboard_arrow_down),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DirectionTouchpad extends StatelessWidget {
  const DirectionTouchpad({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          // aspectRatio: 1,
          child: DirectionButtonsGroup(),
        ),
      ],
    );
  }
}

class Touchpad extends StatelessWidget {
  const Touchpad({super.key});

  @override
  Widget build(BuildContext context) {
    return DirectionTouchpad();
  }
}

class FloatingTouchpadLayer extends StatelessWidget {
  const FloatingTouchpadLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(36),
      child: Container(
        height: 300,
        width: 200,
        child: Touchpad(),
      ),
    );
  }
}
