import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ju_unpa_app/constants/constants.dart';
import 'package:ju_unpa_app/models/locationModel.dart';
import 'package:ju_unpa_app/util/widgets/Error_handler.dart';

class locationService {
  static Future<ErrorHandler> getlocationList() async {
    try {
      var url = '${urlAPI}location/list';
      final uri = Uri.parse(url);

      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final data = jsonDecode(body);
        List _temp = [];

        for (var i in data) {
          _temp.add(i);
        }

        return ErrorHandler(null, locationModel.recipesFromSnapshot(_temp));
      }

      throw 'Invalid   asfasfsdfsdfs';
    } catch (e) {
      return ErrorHandler(e.toString(), null);
    }
  }
}
