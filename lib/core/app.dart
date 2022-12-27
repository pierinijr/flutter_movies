import 'package:flutter/material.dart';
import 'package:flutter_movies/core/routes.dart';
import 'package:flutter_movies/languages/generated/app_localizations.dart';
import 'package:flutter_movies/view_model/movie_view_model.dart';
import 'package:provider/provider.dart';

class FlutterMovies extends StatelessWidget {
  const FlutterMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (_) => MovieViewModel()),
        ],
      child: MaterialApp(
        title: 'Flutter Movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/home",
        routes: routes,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
