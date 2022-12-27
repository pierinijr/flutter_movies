import 'package:flutter/material.dart';
import 'package:flutter_movies/core/routes.dart';

class FlutterMovies extends StatelessWidget {
  const FlutterMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: routes,
    );
  }
}