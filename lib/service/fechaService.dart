import 'dart:convert';

import 'package:ju_unpa_app/API/apiData.dart';
import 'package:ju_unpa_app/models/fecha.dart';

import 'package:http/http.dart' as http;

class fechaService {
  static Future<List<fecha>> getFechaList(int sportId) async {
    var url = 'http://10.0.0.6:8001/programs/listOfSport/$sportId';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final data = jsonDecode(body);
    List _temp = [];

    for (var i in data) {
      _temp.add(i);
    }

    return fecha.recipesFromSnapshot(_temp);
  }

  static Future<List<fecha>> getFechaListApi(int sportId) async {
    return fecha.recipesFromSnapshot(fechaData);
  }
}
