import 'package:flutter/material.dart';

class ToggleToolbarItem extends StatefulWidget {
  final Icon iconOn;
  final Icon iconOff;
  final VoidCallback? onTrunOn;
  final VoidCallback? onTrunOff;
  final bool? defaultValue;

  const ToggleToolbarItem({
    super.key,
    required this.iconOn,
    required this.iconOff,
    this.onTrunOn,
    this.onTrunOff,
    this.defaultValue,
  });

  @override
  State<ToggleToolbarItem> createState() => _ToggleToolbarItemState();
}

class _ToggleToolbarItemState extends State<ToggleToolbarItem> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.defaultValue ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return ToolbarItem(
      icon: _value ? widget.iconOn : widget.iconOff,
      onTap: () {
        final onTapEvent =
            !_value ? widget.onTrunOn ?? () {} : widget.onTrunOff ?? () {};
        onTapEvent();

        setState(() {
          _value = !_value;
        });
      },
    );
  }
}

class ToolbarItem extends StatelessWidget {
  final Icon icon;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final bool? expanded;
  final String? tooltip;

  const ToolbarItem({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.onTap,
    this.expanded,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? "",
      child: SizedBox(
        height: 48,
        width: 48,
        child: IconButton(
          iconSize: 24,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              return backgroundColor ?? Colors.transparent;
            }),
            shape: MaterialStateProperty.resolveWith((states) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              );
            }),
          ),
          onPressed: onTap ?? () {},
          icon: icon,
        ),
      ),
    );
  }
}
