import 'package:flutter/material.dart';
import 'package:flutter_movies/core/app.dart';
import 'package:flutter_movies/view/widgets/buttons/button_favorite.dart';
import 'package:flutter_movies/view/widgets/buttons/button_text.dart';
import 'package:flutter_movies/view/widgets/cards/card_movie_landscape/card_movie.dart';
import 'package:flutter_movies/view/widgets/cards/card_movie_portrait/card_movie.dart';
import 'package:flutter_movies/view/widgets/labels/label_h2.dart';
import 'package:flutter_movies/view/widgets/labels/label_h4.dart';
import 'package:flutter_movies/view/widgets/labels/label_h5.dart';
import 'package:flutter_movies/view/widgets/lists/card_list_error.dart';
import 'package:flutter_movies/view/widgets/lists/card_list_landscape/card_list.dart';
import 'package:flutter_movies/view/widgets/lists/card_list_landscape/card_list_completed.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nock/nock.dart';

import 'mock_results.dart';

class WidgetsTest {
  static viewHome() async {
    testWidgets("[WidgetsTest - View Home] - Check Card List - Success",
        (WidgetTester tester) async {
      MockResults.listHomeViewSuccess();

      await tester.pumpWidget(const FlutterMovies());
      await tester.pumpAndSettle();

      var typeListTitle = find.byType(LabelH5);
      expect(typeListTitle, findsWidgets);

      var listTitle = find.text("Boas vindas");
      expect(listTitle, findsWidgets);

      var typeListSubTitle = find.byType(LabelH4);
      expect(typeListSubTitle, findsWidgets);

      var listSubTitle = find.text("Vamos encontrar um novo filme?");
      expect(listSubTitle, findsWidgets);

      var movieListCards = find.byType(CardListLandscape);
      expect(movieListCards, findsWidgets);

      tester.idle();
    });

    testWidgets("[WidgetsTest - View Home] - Check Card List - Error",
        (WidgetTester tester) async {
      MockResults.listHomeViewError();

      await tester.pumpWidget(const FlutterMovies());
      await tester.pumpAndSettle();

      var typeListTitle = find.byType(LabelH5);
      expect(typeListTitle, findsWidgets);

      var listTitle = find.text("Boas vindas");
      expect(listTitle, findsWidgets);

      var typeListSubTitle = find.byType(LabelH4);
      expect(typeListSubTitle, findsWidgets);

      var listSubTitle = find.text("Vamos encontrar um novo filme?");
      expect(listSubTitle, findsWidgets);

      var movieListCards = find.byType(CardListError);
      expect(movieListCards, findsWidgets);

      tester.idle();
    });

    testWidgets("[WidgetsTest - View Home] - Check Favorite List",
        (WidgetTester tester) async {
      MockResults.listHomeViewSuccess();

      await tester.pumpWidget(const FlutterMovies());
      await tester.pumpAndSettle();
      var favorites = find.byType(FloatingActionButton);

      await tester.tap(favorites);
      await tester.pumpAndSettle();

      var typeListTitle = find.byType(LabelH2);
      expect(typeListTitle, findsWidgets);

      var listTitle = find.text("Favoritos");
      expect(listTitle, findsWidgets);

      var emptyList = find.text("Você não tem favoritos");
      expect(emptyList, findsWidgets);

      var backButton = find.byType(IconButton);
      expect(backButton, findsWidgets);

      await tester.tap(backButton);
      await tester.pumpAndSettle();

      typeListTitle = find.byType(LabelH5);
      expect(typeListTitle, findsWidgets);

      listTitle = find.text("Boas vindas");
      expect(listTitle, findsWidgets);

      tester.idle();
    });

    testWidgets("[WidgetsTest - View Home] - Check View More Button",
        (WidgetTester tester) async {
      MockResults.listHomeViewButtonMore();

      await tester.pumpWidget(const FlutterMovies());
      await tester.pumpAndSettle();

      var viewMore = find.byType(ButtonText).first;
      expect(viewMore, findsWidgets);

      await tester.tap(viewMore);
      await tester.pumpAndSettle();

      var cardMovie = find.byType(CardMovieLandscape);
      expect(cardMovie, findsWidgets);

      tester.idle();
    });
  }

  static viewDetails() async {
    setUpAll(nock.init);

    setUp(() {
      nock.cleanAll();
    });

    testWidgets("[WidgetsTest - View Details] - Check Movie Details - Success",
        (WidgetTester tester) async {
      // TestWidgetsFlutterBinding.ensureInitialized();

      MockResults.listHomeViewSuccess();
      MockResults.listDetailsViewSuccess();

      await tester.pumpWidget(const FlutterMovies());
      await tester.pumpAndSettle();

      var movieListCards = find.byType(CardListLandscape);
      expect(movieListCards, findsWidgets);

      var movieListCardsCompleted = find.byType(CardListLandscapeCompleted);
      expect(movieListCardsCompleted, findsWidgets);

      var movieCards = find.byType(CardMoviePortrait).first;
      await tester.tap(movieCards);
      await tester.pumpAndSettle();

      var movieDetail = find.byType(NestedScrollView);
      expect(movieDetail, findsWidgets);

      tester.idle();
    });

    testWidgets("[WidgetsTest - View Details] - Check Movie Details - Error",
        (WidgetTester tester) async {
      // TestWidgetsFlutterBinding.ensureInitialized();

      MockResults.listHomeViewSuccess();
      MockResults.listDetailsViewError();

      await tester.pumpWidget(const FlutterMovies());
      await tester.pumpAndSettle();

      var movieCards = find.byType(CardMoviePortrait).first;
      await tester.tap(movieCards);
      await tester.pumpAndSettle();

      var movieDetail = find.byType(NestedScrollView);
      expect(movieDetail, isNot(findsWidgets));

      tester.idle();
    });
  }
}
