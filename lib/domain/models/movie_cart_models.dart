class MovieCardModel {
  const MovieCardModel({
    required this.id,
    required this.title,
    this.picture,
    this.releaseDate,
    this.voteAverage,
    this.description,
  });

  final int id;
  final String title;
  final String? picture;
  final String? releaseDate;
  final double? voteAverage;
  final String? description;
}
