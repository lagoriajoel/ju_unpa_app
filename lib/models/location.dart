class location {
  final int id;
  final String name;
  final double latitude;
  final double longitude;

  location(
      {required this.id,
      required this.name,
      required this.latitude,
      required this.longitude});

  factory location.fromJson(dynamic json) {
    return location(
      id: json['id'] as int,
      name: json['name'] as String,
      latitude: json['latitude'] as double,
      longitude: json['latitude'] as double,
    );
  }

  static List<location> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return location.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return '{id: $id,nombre: $name, latitud: $latitude,longitud: $longitude}';
  }
}
