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

  static String getTimeString(int value) {
    final int hour = value ~/ 60;
    final int minutes = value % 60;
    return '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}';
  }
}
