class sport {
  final int id;
  final String nombre;
  final String categoria;
  final String image;

  sport(
      {required this.id,
      required this.nombre,
      required this.categoria,
      required this.image});

  factory sport.fromJson(dynamic json) {
    return sport(
        id: json['id'] as int,
        nombre: json['nombre'] as String,
        categoria: json['categoria'] as String,
        image: json['image'] as String);
  }

  static List<sport> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return sport.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return '{id: $id,nombre: $nombre, categoria: $categoria, image: $image}';
  }
}
