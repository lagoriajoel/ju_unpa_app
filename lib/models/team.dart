class team {
  final String name;
  final int matchWon;
  final int matchLost;
  final int matchTied;
  final int point;

  team(
      {required this.name,
      required this.matchWon,
      required this.matchLost,
      required this.matchTied,
      required this.point});

  factory team.fromJson(dynamic json) {
    return team(
        name: json['name'] as String,
        matchWon: json['matchWon'] as int,
        matchLost: json['matchLost'] as int,
        matchTied: json['matchTied'] as int,
        point: json['point'] as int);
  }

  static List<team> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return team.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return '{nombre: $name, puntos: $point}';
  }
}
