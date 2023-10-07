import 'package:flutter/material.dart';

class DirectionButton extends StatelessWidget {
  final Widget icon;
  final Color? color;
  final double? opacity;

  const DirectionButton({
    super.key,
    required this.icon,
    this.color,
    this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(400),
          color: (color ?? Theme.of(context).colorScheme.primary)
              .withOpacity(opacity ?? .15)),
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

class DirectionTouchpad extends StatelessWidget {
  const DirectionTouchpad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          color: Theme.of(context).colorScheme.primary.withOpacity(.15)),
      child: Container(),
    );
  }
}

class DirectionButtonsGroup extends StatelessWidget {
  const DirectionButtonsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final jumpInLineDPad = Row(
      children: [
        SizedBox(
          width: 65,
          child: DirectionButton(
            icon: Icon(Icons.select_all),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Flexible(
          flex: 3,
          child: DirectionButton(
            icon: Icon(Icons.edit_outlined),
          ),
        ),
      ],
    );

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      // width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: DirectionTouchpad(),
              ),
              SizedBox(height: 8),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 60, minHeight: 30),
                child: jumpInLineDPad,
              ),
            ],
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
