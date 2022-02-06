
import 'package:flutter/material.dart';

class FadeRoute extends PageRouteBuilder {
  FadeRoute({this.page, this.durationMills = 300, RouteSettings? settings})
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
          child: child,
        ),
  );

  final Widget? page;
  final int durationMills;
}
