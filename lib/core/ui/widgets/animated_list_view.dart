import 'package:flutter/material.dart';

enum SlideDirection { fromLeft, fromRight, fromTop, fromBottom }

class AnimatedListView extends StatefulWidget {
  final Widget child;
  final SlideDirection direction;
  final Duration duration;
  final Duration? delayBetweenItems;
  final Curve curve;
  final bool autoPlay;
  final VoidCallback? onAnimationComplete;

  const AnimatedListView({
    super.key,
    required this.child,
    this.direction = SlideDirection.fromRight,
    this.duration = const Duration(milliseconds: 1500),
    this.delayBetweenItems = const Duration(milliseconds: 100),
    this.curve = Curves.easeOut,
    this.autoPlay = true,
    this.onAnimationComplete,
  });

  @override
  State<AnimatedListView> createState() => AnimatedListViewState();
}

class AnimatedListViewState extends State<AnimatedListView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Animation<Offset>> _animations = [];
  int _itemCount = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    if (widget.autoPlay) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _controller.forward();
      });
    }

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onAnimationComplete?.call();
      }
    });
  }

  void _initializeAnimations(int itemCount) {
    if (_itemCount != itemCount) {
      _itemCount = itemCount;
      _animations = List.generate(
        itemCount,
        (index) => Tween(
          begin: getBeginOffset(),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(
              (index * 0.1).clamp(0.0, 1.0),
              1.0,
              curve: widget.curve,
            ),
          ),
        ),
      );
    }
  }

  Offset getBeginOffset() {
    switch (widget.direction) {
      case SlideDirection.fromLeft:
        return const Offset(-1, 0);
      case SlideDirection.fromRight:
        return const Offset(1, 0);
      case SlideDirection.fromTop:
        return const Offset(0, -1);
      case SlideDirection.fromBottom:
        return const Offset(0, 1);
    }
  }

  void forward() => _controller.forward();
  void reverse() => _controller.reverse();
  void repeat() => _controller.repeat();
  void reset() => _controller.reset();
  void stop() => _controller.stop();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.child is! ListView) return widget.child;

    final ListView listView = widget.child as ListView;
    final int itemCount = listView.childrenDelegate.estimatedChildCount ?? 0;
    _initializeAnimations(itemCount);

    return ListView.builder(
      key: listView.key,
      scrollDirection: listView.scrollDirection,
      reverse: listView.reverse,
      controller: listView.controller,
      primary: listView.primary,
      physics: listView.physics,
      shrinkWrap: listView.shrinkWrap,
      padding: listView.padding,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        Widget? child;
        if (listView.childrenDelegate.estimatedChildCount != null &&
            listView.childrenDelegate.estimatedChildCount! > 0) {
          child = listView.childrenDelegate.build(context, index);
        } else {
          try {
            child = (listView.childrenDelegate as SliverChildBuilderDelegate)
                .build(context, index);
          } catch (e) {
            print('Error building item at index $index: $e');
            return const SizedBox();
          }
        }

        if (child == null) return const SizedBox();

        return AnimatedBuilder(
          animation: _controller,
          child: child,
          builder: (context, child) {
            return SlideTransition(
              position: _animations.isNotEmpty
                  ? _animations[index]
                  : const AlwaysStoppedAnimation(Offset.zero),
              child: child,
            );
          },
        );
      },
    );
  }
}

class _ListAnimationWrapper extends StatelessWidget {
  final List<Animation<Offset>> animations;
  final Widget child;
  final Function(int) onItemCount;

  const _ListAnimationWrapper({
    required this.animations,
    required this.child,
    required this.onItemCount,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (child is ListView) {
          final ListView listView = child as ListView;
          onItemCount(listView.childrenDelegate.estimatedChildCount ?? 0);

          return ListView.builder(
            key: listView.key,
            scrollDirection: listView.scrollDirection,
            reverse: listView.reverse,
            controller: listView.controller,
            primary: listView.primary,
            physics: listView.physics,
            shrinkWrap: listView.shrinkWrap,
            padding: listView.padding,
            itemCount: listView.childrenDelegate.estimatedChildCount ?? 0,
            itemBuilder: (context, index) {
              final item =
                  (listView.childrenDelegate as SliverChildBuilderDelegate)
                      .builder(context, index);
              return SlideTransition(
                position: animations.isEmpty
                    ? const AlwaysStoppedAnimation(Offset.zero)
                    : animations[index],
                child: item,
              );
            },
          );
        } else if (child is SliverList) {
          // Handle SliverList implementation if needed
          return child;
        }
        return child;
      },
    );
  }
}
