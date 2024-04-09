import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ju_unpa_app/constants/constants.dart';
import 'package:ju_unpa_app/models/location.dart';

class locationService {
  static Future<List<location>> getLocationList() async {
    const url = '${urlAPI}location/list';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final data = jsonDecode(body);
    List _temp = [];

    for (var i in data) {
      _temp.add(i);
    }

    return location.recipesFromSnapshot(_temp);
  }
}
