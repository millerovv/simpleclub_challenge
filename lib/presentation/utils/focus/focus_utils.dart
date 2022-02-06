import 'package:flutter/material.dart';

void requestFocus(BuildContext context, FocusNode node) => FocusScope.of(context).requestFocus(node);

void resetFocus(BuildContext context) {
  if (FocusManager.instance.primaryFocus != null) {
    FocusManager.instance.primaryFocus!.unfocus();
  } else {
    requestFocus(context, FocusNode());
  }
}
