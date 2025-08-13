import 'package:flutter/material.dart';
import 'package:jewish_app/core/constants/judaism_assets.dart';

/// A reusable wave banner that shows only [visibleHeight] pixels
/// of a larger wave image by clipping the overflow.
class WaveStrip extends StatelessWidget {
  final double visibleHeight;
  final double imageHeight;
  final String imagePath;
  final Color? backgroundColor;
  final Alignment alignment;
  final double?
      visibleFraction; // 0.0 - 1.0, portion of image to show from bottom

  const WaveStrip({
    super.key,
    this.visibleHeight = 70,
    this.imageHeight = 357,
    this.imagePath = '',
    this.backgroundColor,
    this.alignment = Alignment.bottomCenter,
    this.visibleFraction,
  });

  factory WaveStrip.defaultWave(
      {Key? key,
      double visibleHeight = 70,
      double imageHeight = 357,
      Color? backgroundColor,
      double? visibleFraction}) {
    return WaveStrip(
      key: key,
      visibleHeight: visibleHeight,
      imageHeight: imageHeight,
      imagePath: JudaismAssets.branding.loginTopWave,
      backgroundColor: backgroundColor,
      visibleFraction: visibleFraction,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double effectiveVisibleHeight =
        visibleFraction != null && visibleFraction! > 0 && visibleFraction! <= 1
            ? imageHeight * visibleFraction!
            : visibleHeight;
    return SizedBox(
      height: effectiveVisibleHeight,
      width: double.infinity,
      child: ColoredBox(
        color: backgroundColor ?? Colors.transparent,
        child: ClipRect(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: imageHeight,
                child: Image.asset(
                  imagePath.isEmpty
                      ? JudaismAssets.branding.loginTopWave
                      : imagePath,
                  fit: BoxFit.fill,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
