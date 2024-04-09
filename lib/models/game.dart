class game {
  final String date;
  final String place;
  final String schedule;
  final String score_1;
  final String score_2;
  final String team_1;
  final String team_2;

  game(
      {required this.date,
      required this.place,
      required this.schedule,
      required this.score_1,
      required this.score_2,
      required this.team_1,
      required this.team_2});

  factory game.fromJson(dynamic json) {
    return game(
        date: json['Date'] as String,
        place: json['place'] as String,
        schedule: json['schedule'] as String,
        score_1: json['score_1'] as String,
        score_2: json['score_2'] as String,
        team_1: json['team_1'] as String,
        team_2: json['team_2'] as String);
  }

  static List<game> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return game.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return '{game: $game}';
  }
}
