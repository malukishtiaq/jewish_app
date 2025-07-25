import 'package:flutter/material.dart';
import '../../../../export_files.dart';
import 'base_shimmer.dart';
import 'animated_list_view.dart';

class ShimmerList extends StatelessWidget {
  final Widget Function(BuildContext, int) shimmerBuilder;
  final int itemCount;
  final double? itemSpacing;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final Color? baseColor;
  final Color? highlightColor;
  final Axis scrollDirection;
  final bool enableAnimation;
  final SlideDirection slideDirection;
  final Duration animationDuration;

  const ShimmerList({
    super.key,
    required this.shimmerBuilder,
    this.itemCount = 5,
    this.itemSpacing,
    this.padding,
    this.physics,
    this.shrinkWrap = true,
    this.baseColor,
    this.highlightColor,
    this.scrollDirection = Axis.vertical,
    this.enableAnimation = true,
    this.slideDirection = SlideDirection.fromRight,
    this.animationDuration = const Duration(milliseconds: 800),
  });

  @override
  Widget build(BuildContext context) {
    Widget listView = ListView.separated(
      padding: padding,
      physics: physics ?? const NeverScrollableScrollPhysics(),
      shrinkWrap: shrinkWrap,
      scrollDirection: scrollDirection,
      itemCount: itemCount,
      separatorBuilder: (context, index) => SizedBox(
        height: itemSpacing ?? 10.h,
        width: itemSpacing ?? 10.h,
      ),
      itemBuilder: (context, index) => BaseShimmer(
        baseColor: baseColor ?? appTheme.gray900,
        highlightColor: highlightColor ?? appTheme.gray900.withOpacity(0.3),
        child: shimmerBuilder(context, index),
      ),
    );

    if (enableAnimation) {
      listView = AnimatedListView(
        direction: slideDirection,
        duration: animationDuration,
        child: listView,
      );
    }

    return listView;
  }
}
