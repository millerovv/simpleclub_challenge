import 'package:flutter/material.dart';

const backgroundColor = Color(0xFF111E26);
const primaryColor = Color(0xFF3074F5);
const textPrimary = Color(0xFFF9FCFE);

ThemeData createBaseTheme(BuildContext context) => ThemeData(
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme(
        primary: primaryColor,
        primaryVariant: backgroundColor,
        secondary: primaryColor,
        secondaryVariant: primaryColor,
        background: backgroundColor,
        surface: Color(0xFF1C232C),
        onBackground: textPrimary,
        error: Color(0xFFD24848),
        onError: textPrimary,
        onPrimary: textPrimary,
        onSecondary: textPrimary,
        onSurface: textPrimary,
        brightness: Brightness.dark,
      ),
      textTheme: _buildAppTextTheme(context),
      inputDecorationTheme: InputDecorationTheme(labelStyle: Theme.of(context).textTheme.subtitle1?.copyWith(color: textPrimary)),
      iconTheme: Theme.of(context).iconTheme.copyWith(color: textPrimary),
    );

TextTheme _buildAppTextTheme(BuildContext context) {
  TextTheme textTheme = Theme.of(context).textTheme.apply(displayColor: textPrimary, bodyColor: textPrimary);
  return textTheme.copyWith(bodyText2: textTheme.bodyText2!.copyWith(height: 1.2));
}
