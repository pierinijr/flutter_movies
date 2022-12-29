import 'dart:convert';

import 'package:http/http.dart';

extension Result on Response {
  dynamic getData() {
    var data = jsonDecode(utf8.decode(bodyBytes));
    return data;
  }
}