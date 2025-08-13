import 'package:flutter/material.dart';

class DecorativePattern extends StatelessWidget {
  const DecorativePattern({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      child: Stack(
        children: [
          // Complex pattern grid
          _buildPatternGrid(),

          // Additional decorative elements
          _buildDecorativeElements(),
        ],
      ),
    );
  }

  Widget _buildPatternGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
        childAspectRatio: 1,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: 64,
      itemBuilder: (context, index) {
        return Container(
          width: 5.5,
          height: 5.5,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(1),
          ),
        );
      },
    );
  }

  Widget _buildDecorativeElements() {
    return Stack(
      children: [
        // Hebrew text elements (simplified)
        Positioned(
          top: 10,
          left: 20,
          child: _buildHebrewElement(47.9, 24.87),
        ),
        Positioned(
          top: 15,
          right: 25,
          child: _buildHebrewElement(30.02, 34.95),
        ),
        Positioned(
          bottom: 20,
          left: 30,
          child: _buildHebrewElement(29.11, 25.5),
        ),
        Positioned(
          bottom: 15,
          right: 20,
          child: _buildHebrewElement(28.36, 24.86),
        ),
      ],
    );
  }

  Widget _buildHebrewElement(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
