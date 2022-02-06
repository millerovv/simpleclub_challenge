import 'package:flutter/material.dart';
import 'package:simpleclub_challenge/presentation/utils/focus/focus_utils.dart';

class ResetFocusOnTap extends StatelessWidget {
  const ResetFocusOnTap({Key? key, required this.child, this.resetOnScroll = false}) : super(key: key);

  final Widget child;
  final bool resetOnScroll;

  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () => resetFocus(context),
    onPanStart: resetOnScroll ? (_) => resetFocus(context) : null,
    onHorizontalDragStart: resetOnScroll ? (_) => resetFocus(context) : null,
    child: child,
  );
}