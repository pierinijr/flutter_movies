import 'package:flutter_test/flutter_test.dart';

import 'models/details_model.dart';
import 'models/list_arguments_model.dart';
import 'models/lists_model.dart';

void main() {
  group('Models Test', () {
    DetailsModelTest.checkModelReturn();
    ListArgumentsModelTest.checkModelReturn();
    ListsModelTest.checkModelReturn();
  });
}
