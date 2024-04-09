class info {
  final int id;
  final String title_info;
  final String body_info;

  info({
    required this.id,
    required this.title_info,
    required this.body_info,
  });

  factory info.fromJson(dynamic json) {
    return info(
      id: json['id'] as int,
      title_info: json['title_info'] as String,
      body_info: json['body_info'] as String,
    );
  }

  static List<info> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return info.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return '{id: $id,nombre: $title_info, categoria: $body_info}';
  }
}
