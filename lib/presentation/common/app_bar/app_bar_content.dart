import 'package:flutter/material.dart';

class AppBarContent extends StatelessWidget {
  const AppBarContent({
    this.title,
    this.withBackButton = true,
    this.onBackButtonTap,
    this.bottomChild,
    this.optionChild,
    this.backButtonIcon,
  });

  final Widget? title;

  final Widget? bottomChild;

  final Widget? optionChild;

  final bool withBackButton;

  final IconData? backButtonIcon;

  final VoidCallback? onBackButtonTap;

  @override
  Widget build(BuildContext context) {
    final hasBottom = bottomChild != null;
    return Stack(
      children: <Widget>[
        // if (withBackButton)
        //   Padding(
        //     padding: EdgeInsets.only(top: hasBottom ? 10.0 : 0),
        //     child: Align(
        //       alignment: hasBottom ? Alignment.topLeft : Alignment.centerLeft,
        //       child: _buildBackButton(context),
        //     ),
        //   ),
        if (title != null)
          Padding(
            padding: EdgeInsets.only(
                top: hasBottom ? 10.0 : 0, left: withBackButton ? 48 : 16, right: withBackButton || optionChild != null ? 48 : 16),
            child: Align(
              alignment: hasBottom ? (withBackButton ? Alignment.topCenter : Alignment.topLeft) : Alignment.center,
              child: title,
            ),
          ),
        if (optionChild != null) Align(alignment: hasBottom ? Alignment.topRight : Alignment.centerRight, child: optionChild),
        if (hasBottom)
          Align(
            alignment: Alignment.bottomLeft,
            child: bottomChild,
          ),
      ],
    );
  }
}
