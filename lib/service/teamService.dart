import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ju_unpa_app/models/team.dart';

class teamService {
  static Future<List<team>> getTeamOfSport(idSport) async {
    int id = idSport;
    var url = 'http://10.0.0.6:8001/teams/listOfSport/$id';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final data = jsonDecode(body);
    List _temp = [];

    for (var i in data) {
      _temp.add(i);
    }

    return team.recipesFromSnapshot(_temp);
  }
}
