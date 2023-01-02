import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:nock/nock.dart';

class MockResults {
  static listHomeViewSuccess() async {
    var mockListResult = {
      "page": 1,
      "results": [
        {
          "id": 76600,
          "poster_path": "/mbYQLLluS651W89jO7MOZcLSCUw.jpg",
          "release_date": "2022-12-14",
          "title": "Avatar: O Caminho da Água",
          "vote_average": 7.7,
          "vote_count": 3251
        },
      ],
      "total_pages": 92,
      "total_results": 1839
    };

    List<String> movieLists = [
      "now_playing",
      "top_rated",
      "upcoming",
      "popular"
    ];

    for (var list in movieLists) {
      {
        nock('https://api.themoviedb.org')
            .get(contains(list))
            .reply(200, json.encode(mockListResult));
      }
    }
  }

  static listHomeViewError() async {
    List<String> movieLists = [
      "now_playing",
      "top_rated",
      "upcoming",
      "popular"
    ];

    for (var list in movieLists) {
      {
        nock('https://api.themoviedb.org')
            .get(contains(list))
            .reply(103, json.encode({}));
      }
    }
  }

  static listHomeViewButtonMore() async {
    var mockListResult = {
      "page": 1,
      "results": [
        {
          "id": 76600,
          "poster_path": "/mbYQLLluS651W89jO7MOZcLSCUw.jpg",
          "release_date": "2022-12-14",
          "title": "Avatar: O Caminho da Água",
          "vote_average": 7.7,
        },
        {"id": 76600, "title": "Teste"},
        {"id": 76600, "title": "Teste"},
        {"id": 76600, "title": "Teste"},
        {"id": 76600, "title": "Teste"},
        {"id": 76600, "title": "Teste"},
        {"id": 76600, "title": "Teste"},
        {"id": 76600, "title": "Teste"},
        {"id": 76600, "title": "Teste"},
        {"id": 76600, "title": "Teste"},
        {"id": 76600, "title": "Teste"},
        {"id": 76600, "title": "Teste"},
        {"id": 76600, "title": "Teste"},
        {"id": 76600, "title": "Teste"},
        {"id": 76600, "title": "Teste"},
        {"id": 76600, "title": "Teste"},
        {"id": 76600, "title": "Teste"},
        {"id": 76600, "title": "Teste"},
        {"id": 76600, "title": "Teste"},
        {"id": 76600, "title": "Teste"},
      ],
      "total_pages": 92,
      "total_results": 1839
    };

    List<String> movieLists = [
      "now_playing",
      "top_rated",
      "upcoming",
      "popular"
    ];

    for (var list in movieLists) {
      {
        nock('https://api.themoviedb.org')
            .get(contains(list))
            .reply(200, json.encode(mockListResult));
      }
    }
  }

  static listDetailsViewSuccess() async {
    var mockDetailsResult = {
      "backdrop_path": "/s16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg",
      "id": 76600,
      "overview":
          "12 anos depois de explorar Pandora e se juntar aos Na'vi, Jake Sully formou uma família com Neytiri e se estabeleceu entre os clãs do novo mundo. Porém, a paz não durará para sempre.",
      "poster_path": "/mbYQLLluS651W89jO7MOZcLSCUw.jpg",
      "release_date": "2022-12-14",
      "runtime": 192,
      "title": "Avatar: O Caminho da Água",
      "vote_average": 7.695,
      "vote_count": 3260,
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

    nock('https://api.themoviedb.org')
        .get(contains("76600"))
        .reply(200, json.encode(mockDetailsResult));
  }

  static listDetailsViewError() async {
    nock('https://api.themoviedb.org')
        .get(contains("76600"))
        .reply(103, json.encode({}));
  }
}
