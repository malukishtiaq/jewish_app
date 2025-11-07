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
                  // Logo with circular progress indicator
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // White circular background for logo
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),
                        // Logo in the center
                        ClipOval(
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.white,
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/judaism/logo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        // Circular progress indicator around the logo
                        const SizedBox(
                          width: 120,
                          height: 120,
                          child: CircularProgressIndicator(
                            strokeWidth: 4,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFF8A5694), // Purple color
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (message.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    Text(message, style: theme.textTheme.headlineMedium),
                  ],
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
