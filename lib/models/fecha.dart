class fecha {
  final int id;

  final String description;

  final List<dynamic> games;

  fecha({required this.id, required this.description, required this.games});

  factory fecha.fromJson(dynamic json) {
    return fecha(
      id: json['id'] as int,
      description: json['description'] as String,
      games: json['games'] as List<dynamic>,
    );
  }

  static List<fecha> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return fecha.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return '{id: $id, description: $description, games: $games}';
  }
}
