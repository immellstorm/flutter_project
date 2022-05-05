import 'package:flutter_project/data/dtos/show_card_dto.dart';
import 'package:flutter_project/domain/models/movie_cart_models.dart';

extension ShowCardFromDTOToDomain on ShowCardDTO {
  MovieCardModel toDomain() {
    return MovieCardModel(
      id: show?.id ?? 0,
      title: show?.title ?? '',
      picture: show?.picture?.original ?? '',
      releaseDate: show?.releaseDate,
      voteAverage: score,
      description: show?.description,
    );
  }
}
