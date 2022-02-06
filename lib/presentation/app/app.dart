import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simpleclub_challenge/presentation/routing/app_router.dart';
import 'package:simpleclub_challenge/presentation/utils/ui_utils.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static const appRouter = AppRouter();

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Simpleclub Challenge',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF111E26),
          backgroundColor: Color(0xFFF9F9F9),
          colorScheme: const ColorScheme(
            primary: Color(0xFF111E26),
            primaryVariant: Color(0xFF111E26),
            secondary: Color(0xFF111E26),
            secondaryVariant: Color(0xFF111E26),
            background: Colors.white,
            surface: Colors.white,
            onBackground: Color(0xFF111E26),
            error: Color(0xFFD24848),
            onError: Colors.white,
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onSurface: Color(0xFF111E26),
            brightness: Brightness.light,
          ),
        ),
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: contentSetupRouteName,
        builder: (context, child) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
          return ScrollConfiguration(behavior: NoGlowScrollBehavior(), child: child!);
        },
      );
}
