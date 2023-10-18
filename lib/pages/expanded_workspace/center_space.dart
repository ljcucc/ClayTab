import 'package:code_playground/pages/expanded_workspace/background_img_provider.dart';
import 'package:code_playground/pages/expanded_workspace/expanded_style.dart';
import 'package:code_playground/widgets/material_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CenterSpace extends StatelessWidget {
  final ExpandedStyle? style;
  final Widget child;

  const CenterSpace({
    super.key,
    this.style,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final style = this.style ?? ExpandedStyle.outter();
    final color = Theme.of(context).colorScheme.primary;

    return Consumer<BackgroundImageProvider>(
      builder: (context, value, _) {
        final backgroundImage = value.image;

        return Expanded(
          child: MaterialContainer(
            backgroundColor: Theme.of(context).colorScheme.surface,
            surfaceTint: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
            elevation: style.innerElevation,
            border: style.border(Theme.of(context)
                .colorScheme
                .onPrimaryContainer
                .withOpacity(.5)),
            child: Stack(
              children: [
                if (backgroundImage != null)
                  Positioned.fill(
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(color, BlendMode.hue),
                      child: Image(
                        image: backgroundImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                Positioned.fill(
                  child: Container(
                      color: Theme.of(context)
                          .colorScheme
                          .surface
                          .withOpacity(.0)),
                ),
                child,
              ],
            ),
          ),
        );
      },
    );
  }
}
