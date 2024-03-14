class team {
  final String nombre;
  final int matchWon;
  final int matchLost;
  final int matchTied;
  final int point;

  team(
      {required this.nombre,
      required this.matchWon,
      required this.matchLost,
      required this.matchTied,
      required this.point});

  factory team.fromJson(dynamic json) {
    return team(
        nombre: json['nombre'] as String,
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
    return '{nombre: $nombre, puntos: $point}';
  }
}
