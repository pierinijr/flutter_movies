import 'package:flutter_movies/model/list_arguments_model.dart';
import 'package:flutter_movies/repository/api_status.dart';
import 'package:flutter_test/flutter_test.dart';

class ListArgumentsModelTest {
  static checkModelReturn() async {
    ListArgumentsModel listArgumentsModel;

    setUp(() {
      listArgumentsModel =
          ListArgumentsModel(title: "", type: Failure, listType: "");
    });

    test("[ListArgumentsModel] - Check model return", () {
      listArgumentsModel = ListArgumentsModel(
        title: "Avatar: The Way of Water",
        type: Success,
        listType: "now_playing",
      );

      expect(listArgumentsModel.title, isNotEmpty);
      expect(listArgumentsModel.type, equals(Success));
      expect(listArgumentsModel.listType, matches("now_playing"));
    });
  }
}
