import 'package:flutter/material.dart';

class Utils {
  static void goView(
    BuildContext context,
    String name,
  ) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      name,
      ModalRoute.withName('/home'),
    );
  }
}