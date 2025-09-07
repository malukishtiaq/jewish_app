import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress;
  final double height;
  final Color backgroundColor;
  final Color progressColor;
  final double borderRadius;

  const CustomProgressBar({
    super.key,
    required this.progress,
    this.height = 9.0,
    this.backgroundColor = const Color(0xFFF0F0F0),
    this.progressColor = const Color(0xFFF2A41E),
    this.borderRadius = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress / 100,
        child: Container(
          decoration: BoxDecoration(
            color: progressColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
