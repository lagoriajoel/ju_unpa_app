class sport {
  final int id;
  final String name;
  final String category;
  final String image;

  sport(
      {required this.id,
      required this.name,
      required this.category,
      required this.image});

  factory sport.fromJson(dynamic json) {
    return sport(
        id: json['id'] as int,
        name: json['name'] as String,
        category: json['category'] as String,
        image: json['image'] as String);
  }

  static List<sport> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return sport.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return '{id: $id,nombre: $name, categoria: $category, image: $image}';
  }
}
