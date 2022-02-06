import 'package:flutter/material.dart';

class AppBarSliverDelegate extends SliverPersistentHeaderDelegate {
  AppBarSliverDelegate({
    required this.child,
    this.height = appBarHeight,
    this.forceElevated = false,
    this.forceZeroAnimation = false,
  });

  static const double appBarHeight = 52.0;

  final Widget child;
  final double height;
  final bool forceElevated;
  final bool forceZeroAnimation;

  double _calculateShadowAnimationValue(double shrinkOffset) => forceElevated ? 1.0 : 1 - (maxExtent - shrinkOffset) / maxExtent;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    DecorationTween containerDecoration = DecorationTween(
        begin: BoxDecoration(color: Theme.of(context).backgroundColor, boxShadow: const []),
        end: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            boxShadow: const [BoxShadow(color: Color(0x1F000000), offset: Offset(0, 2), blurRadius: 6)]));

    return AnimatedContainer(
      duration: forceElevated && !forceZeroAnimation ? const Duration(milliseconds: 300) : const Duration(),
      width: MediaQuery.of(context).size.width,
      height: maxExtent,
      decoration: containerDecoration.transform(_calculateShadowAnimationValue(shrinkOffset)),
      child: child,
    );
  }

  @override
  bool shouldRebuild(AppBarSliverDelegate oldDelegate) => true;

  @override
  double get maxExtent => height + 0.00000001;

  @override
  double get minExtent => height;
}
