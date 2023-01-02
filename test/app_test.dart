import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'model/details_model.dart';
import 'model/list_arguments_model.dart';
import 'model/lists_model.dart';
import 'utils/utils.dart';
import 'widgets/widgets.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  dotenv.testLoad(fileInput: File('.env').readAsStringSync());
  group('Model Tests', () {
    DetailsModelTest.checkModelReturn();
    ListArgumentsModelTest.checkModelReturn();
    ListsModelTest.checkModelReturn();
  });

  group('Utils Tests', () {
    UtilsTest.checkFunctions();
  });

  group('Widgets Tests', () {
    WidgetsTest.viewHome();
    WidgetsTest.viewDetails();
  });
}
