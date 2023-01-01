import 'package:flutter_movies/model/details_model.dart';
import 'package:flutter_test/flutter_test.dart';

class DetailsModelTest {
  static checkModelReturn() async {
    DetailsModel detailsModel;

    setUp(() {
      detailsModel = DetailsModel();
    });

    test("[DetailsModel] - Check model return", () {
      detailsModel = DetailsModel(
          backdropPath: "",
          genres: [Genres(id: 878, name: "Ficção científica")],
          id: 87096,
          title: "Avatar: O Caminho da Água",
          videos: Videos(results: [
            VideoResults(
              name: "Trailer Legendado",
              key: "fMdb0nGsICE",
              site: "YouTube",
              type: "Trailer",
              publishedAt: "2022-11-02T12:53:26.000Z",
            )
          ]));

      expect(detailsModel.backdropPath, isEmpty);
      expect(detailsModel.genres, isNotNull);
      expect(detailsModel.id, isNotNull);
      expect(detailsModel.title, isNotNull);
      expect(detailsModel.videos, isNotNull);

      expect(detailsModel.homepage, isNull);
      expect(detailsModel.imdbId, isNull);
    });

    test("[DetailsModel] - Check model from json return", () {
      var jsonReturn = {
        "backdrop_path": "",
        "genres": [
          {"id": 878, "name": "Ficção científica"},
        ],
        "id": 76600,
        "title": "Avatar: O Caminho da Água",
        "videos": {
          "results": [
            {
              "iso_639_1": "pt",
              "iso_3166_1": "BR",
              "name": "Trailer Legendado",
              "key": "fMdb0nGsICE",
              "site": "YouTube",
              "size": 1080,
              "type": "Trailer",
              "official": true,
              "published_at": "2022-11-02T12:53:26.000Z",
              "id": "63626e96a6a4c10082da772f"
            },
          ]
        }
      };
      detailsModel = DetailsModel.fromJson(jsonReturn);

      expect(detailsModel.backdropPath, isEmpty);
      expect(detailsModel.genres, isNotNull);
      expect(detailsModel.id, isNotNull);
      expect(detailsModel.title, isNotNull);
      expect(detailsModel.videos, isNotNull);

      expect(detailsModel.homepage, isNull);
      expect(detailsModel.imdbId, isNull);
    });
  }
}
