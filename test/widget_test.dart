import 'package:flutter_test/flutter_test.dart';

import 'model/details_model.dart';
import 'model/list_arguments_model.dart';
import 'model/lists_model.dart';

void main() {
  group('Model Tests', () {
    DetailsModelTest.checkModelReturn();
    ListArgumentsModelTest.checkModelReturn();
    ListsModelTest.checkModelReturn();
  });
}
