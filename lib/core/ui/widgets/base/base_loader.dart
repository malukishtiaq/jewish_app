import 'package:jewish_app/export_files.dart';
import 'package:flutter/material.dart';

class BaseLoader extends StatelessWidget {
  const BaseLoader({
    super.key,
    required this.isLoading,
    required this.child,
    this.message = '',
  });

  final bool isLoading;
  final Widget child;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),
        if (isLoading) ...[
          Positioned.fill(
            child:
                Container(color: AppThemeColors.lightBlue800.withOpacity(0.25)),
          ),
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image.asset(
                      'assets/images/png/app_logo.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Text(message, style: theme.textTheme.headlineMedium),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
