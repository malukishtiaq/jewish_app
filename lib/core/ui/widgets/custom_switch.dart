import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  CustomSwitch({
    super.key,
    required this.onChange,
    this.alignment,
    this.value,
    this.width,
    this.height,
    this.margin,
  });

  final Alignment? alignment;

  bool? value;

  final Function(bool) onChange;

  final double? width;

  final double? height;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        margin: margin,
        child: alignment != null
            ? Align(
                alignment: alignment ?? Alignment.center, child: switchWidget)
            : switchWidget);
  }

  Widget get switchWidget => Switch(
        value: value ?? false,
        onChanged: (value) {
          onChange(value);
        },
        activeColor: Colors.red,
        activeTrackColor: Colors.green.withOpacity(0.3),
        inactiveThumbColor: Colors.grey[400],
        inactiveTrackColor: Colors.grey[300],
      );
}
