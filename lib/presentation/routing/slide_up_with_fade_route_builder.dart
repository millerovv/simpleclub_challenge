import 'package:flutter/material.dart';

class SlideUpWithFadeRoute extends PageRouteBuilder {
  SlideUpWithFadeRoute({this.page, this.durationMills = 300, RouteSettings? settings})
      : super(
    settings: settings,
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page!,
    transitionDuration: Duration(milliseconds: durationMills),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
  );

  final Widget? page;
  final int durationMills;
}