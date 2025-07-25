import 'package:flutter/material.dart';
import 'package:jewish_app/export_files.dart';

class ShadowBackground extends StatelessWidget {
  final Widget child;
  const ShadowBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtils.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomImageView(imagePath: AppConstants.imgLoginBackground),
          ),
          child,
        ],
      ),
    );
  }
}
