import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ju_unpa_app/API/apiData.dart';
import 'package:ju_unpa_app/constants/constants.dart';
import 'package:ju_unpa_app/models/team.dart';

class teamService {
  static Future<List<team>> getTeamOfSport(idSport) async {
    try {
      int id = idSport;
      var url = '${urlAPI}teams/listOfSport/$id';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final data = jsonDecode(body);
        List _temp = [];

        for (var i in data) {
          _temp.add(i);
        }

        return team.recipesFromSnapshot(_temp);
      }
      throw 'Invalid';
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<team>> getTeamOfSportApi(idSport) async {
    return team.recipesFromSnapshot(team1Data);
  }
}
