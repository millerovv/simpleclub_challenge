import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simpleclub_challenge/presentation/pages/content_setup/content_setup_page.dart';
import 'package:simpleclub_challenge/presentation/pages/home/home_page.dart';

const contentSetupRouteName = 'contentSetupRoute';
const homeRouteName = 'homeRoute';

class AppRouter {
  const AppRouter();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case contentSetupRouteName:
        return ContentSetupRoute(routeName: contentSetupRouteName);
      case homeRouteName:
        return HomeRoute(routeName: homeRouteName);
      default:
        return CupertinoPageRoute(builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))));
    }
  }
}
