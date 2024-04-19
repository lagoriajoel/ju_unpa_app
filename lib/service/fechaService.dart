import 'dart:convert';

import 'package:ju_unpa_app/API/apiData.dart';
import 'package:ju_unpa_app/constants/constants.dart';
import 'package:ju_unpa_app/models/fecha.dart';

import 'package:http/http.dart' as http;
import 'package:ju_unpa_app/util/widgets/Error_handler.dart';

class fechaService {
  static Future<ErrorHandler> getFechaList(int sportId) async {
    try {
      var url = '${urlAPI}programs/listOfSport/$sportId';
      final uri = Uri.parse(url);

      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final data = jsonDecode(body);
        List _temp = [];

        for (var i in data) {
          _temp.add(i);
        }

        return ErrorHandler(null, fecha.recipesFromSnapshot(_temp));
      }

      throw 'Invalid   asfasfsdfsdfs';
    } catch (e) {
      return ErrorHandler(e.toString(), null);
    }
  }

  static Future<List<fecha>> getFechaListApi(int sportId) async {
    return fecha.recipesFromSnapshot(fechaData);
  }
}
