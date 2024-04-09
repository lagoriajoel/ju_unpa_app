import 'dart:convert';

import 'package:ju_unpa_app/API/apiData.dart';
import 'package:ju_unpa_app/constants/constants.dart';
import 'package:ju_unpa_app/models/fecha.dart';

import 'package:http/http.dart' as http;

class fechaService {
  static Future<List<fecha>> getFechaList(int sportId) async {
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

        return fecha.recipesFromSnapshot(_temp);
      }

      throw 'Invalid';
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<fecha>> getFechaListApi(int sportId) async {
    return fecha.recipesFromSnapshot(fechaData);
  }
}
