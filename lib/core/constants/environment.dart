import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConstantsEnvironment {
  String get apiKey => dotenv.get('APIKEY');
}