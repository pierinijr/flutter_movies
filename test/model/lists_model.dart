import 'package:flutter_movies/model/lists_model.dart';
import 'package:flutter_test/flutter_test.dart';

class ListsModelTest {
  static checkModelReturn() async {
    ListsModel listsModel;

    setUp(() {
      listsModel = ListsModel();
    });

    test("[ListsModel] - Check model return", () {
      listsModel = ListsModel(
          type: "now_playing",
          page: 2,
          results: [Results(releaseDate: "2022-12-14")]);

      expect(listsModel.type, matches("now_playing"));
      expect(listsModel.page, isNotNull);
      expect(listsModel.results, isNotNull);

      expect(listsModel.totalPages, isNull);
      expect(listsModel.totalResults, isNull);
    });

    test("[ListsModel] - Check model from json return", () {
      var jsonReturn = {
        "page": 1,
        "results": [
          {
            "title": "Avatar: O Caminho da Água",
            "vote_average": 7.7,
          },
        ],
        "total_pages": 85,
        "total_results": 1688
      };

      listsModel = ListsModel.fromJson(jsonReturn, "now_playing");

      expect(listsModel.type, matches("now_playing"));
      expect(listsModel.page, isNotNull);
      expect(listsModel.results, isNotNull);

      expect(listsModel.results?.first.voteAverage, equals(7.7));
    });
  
    test("[ListsModel] - Check model to map return", () {
      Results results = Results(title: "Avatar: O Caminho da Água");
      Map<String, dynamic> map = results.toMap();

      expect(map["title"], matches("Avatar: O Caminho da Água"));
      expect(map["releaseDate"], isNull);
    });
  }
}
