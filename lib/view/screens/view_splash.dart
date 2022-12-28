import 'package:flutter_movies/core/utils.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/material.dart';

class ViewSplash extends StatefulWidget {
  const ViewSplash({super.key});

  @override
  State<ViewSplash> createState() => _ViewSplashState();
}

class _ViewSplashState extends State<ViewSplash> {
  void loadApp(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
      Utils.goView(context, "/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    loadApp(context);
    return Scaffold(body: Container());
  }
}