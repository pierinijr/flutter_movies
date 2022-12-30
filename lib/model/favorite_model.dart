class Favorite {
  const Favorite({
    required this.id,
    required this.title,
    this.voteAverage,
    this.posterPath,
  });

  final int id;
  final String title;
  final double? voteAverage;
  final String? posterPath;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'voteAverage': voteAverage,
      'posterPath': posterPath,
    };
  }

  @override
  String toString() {
    return 'Favorite{id: $id, name: $title}';
  }
}