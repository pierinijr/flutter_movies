import 'package:flutter/material.dart';

class Utils {
  static void goView(BuildContext context, String name,
      {Object? arguments, bool removeUntil = false}) {
    if (name.startsWith("/home")) {
      removeUntil = true;
    }

    if (!removeUntil) {
      Navigator.pushNamed(context, name, arguments: arguments);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, name, (route) => false,
          arguments: arguments);
    }
  }
}
