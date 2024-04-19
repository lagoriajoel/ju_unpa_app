class locationModel {
  final int id;
  final String name;
  final double latitude;
  final double longitude;

  locationModel(
      {required this.id,
      required this.name,
      required this.latitude,
      required this.longitude});

  factory locationModel.fromJson(dynamic json) {
    return locationModel(
      id: json['id'] as int,
      name: json['name'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }

  static List<locationModel> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return locationModel.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return '{id: $id,nombre: $name, latitud: $latitude,longitud: $longitude}';
  }
}
