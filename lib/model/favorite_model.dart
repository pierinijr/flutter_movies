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
}