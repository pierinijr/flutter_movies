import 'package:flutter_movies/core/constants/endpoints.dart';
import 'package:flutter_movies/core/constants/environment.dart';
import 'package:flutter_movies/core/constants/images.dart';
import 'package:flutter_movies/core/constants/spacings.dart';
import 'package:flutter_movies/core/constants/status_code.dart';

class Constants {
  static ConstantsEnvironment get environment => ConstantsEnvironment();
  static ConstantsEndpoints get endpoints => ConstantsEndpoints();
  static ConstantsStatusCode get statusCode => ConstantsStatusCode();
  static ConstantsImages get images => ConstantsImages();
  static ConstantsSpacings get spacings => ConstantsSpacings();
}