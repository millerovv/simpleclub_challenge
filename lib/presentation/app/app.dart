import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simpleclub_challenge/presentation/routing/app_router.dart';
import 'package:simpleclub_challenge/presentation/theme/app_theme.dart';
import 'package:simpleclub_challenge/presentation/utils/ui_utils.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static const appRouter = AppRouter();

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Simpleclub Challenge',
        debugShowCheckedModeBanner: false,
        theme: createBaseTheme(context),
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: contentSetupRouteName,
        builder: (context, child) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.dark));
          return ScrollConfiguration(behavior: NoGlowScrollBehavior(), child: child!);
        },
      );
}
