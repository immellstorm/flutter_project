import 'package:flutter_project/data/db/database.dart';

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

extension MovieCardModelToDatabase on MovieCardModel {
  MovieTableData toDatabase() {
    return MovieTableData(
      id: id,
      title: title,
      picture: picture,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      description: description,
    );
  }
}

extension MovieTableDataToDomain on MovieTableData {
  MovieCardModel toDomain() {
    return MovieCardModel(
      id: id,
      title: title,
      picture: picture,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      description: description,
    );
  }
}
