import 'dart:convert';

import 'package:ju_unpa_app/API/apiData.dart';
import 'package:ju_unpa_app/models/sport.dart';
import 'package:http/http.dart' as http;

class sportService {
  // static Future<List<sport>> getSportList() async {
  //   const url = 'http://10.0.0.6:8001/disciplinas/list';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final data = jsonDecode(body);
  //   List _temp = [];

  //   for (var i in data) {
  //     _temp.add(i);
  //   }

  //   return sport.recipesFromSnapshot(_temp);
  // }

  static Future<List<sport>> getSportListApi() async {
    return sport.recipesFromSnapshot(dataSport);
  }
}
