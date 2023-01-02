import 'package:flutter/material.dart';
import 'package:flutter_movies/core/app.dart';
import 'package:flutter_movies/core/utils.dart';
import 'package:flutter_movies/languages/generated/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

class UtilsTest {
  static checkFunctions() async {
    test("[Utils] - Check function getTimeString", () {
      String value = Utils.getTimeString(192);
      expect(value, equals('03h 12m'));
    });

    test("[Utils] - Check function dateConvert", () {
      String value = Utils.dateConvert("2022-12-14");
      expect(value, equals('14-12-2022'));
    });

    FlutterMovies app = const FlutterMovies();
    testWidgets('[Utils] - Check function listTitle', (WidgetTester tester) async {
      await tester.pumpWidget(app);
      BuildContext context = tester.element(find.byType(Container));

      String value = "";

      value = Utils.listTitle(context, "latest");
      expect(value, AppLocalizations.of(context)!.latest);

      value = Utils.listTitle(context, "now_playing");
      expect(value, AppLocalizations.of(context)!.nowPlaying);
      
      value = Utils.listTitle(context, "popular");
      expect(value, AppLocalizations.of(context)!.popular);

      value = Utils.listTitle(context, "top_rated");
      expect(value, AppLocalizations.of(context)!.topRated);

      value = Utils.listTitle(context, "upcoming");
      expect(value, AppLocalizations.of(context)!.upcoming);
    });
  }
}