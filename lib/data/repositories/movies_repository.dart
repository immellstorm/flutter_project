import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_project/components/constants.dart';
import 'package:flutter_project/data/db/database.dart';
import 'package:flutter_project/data/dtos/show_card_dto.dart';
import 'package:flutter_project/data/mappers/show_mapper.dart';
import 'package:flutter_project/data/repositories/interceptors%20/dio_error_interceptor.dart';
import 'package:flutter_project/domain/models/home_model.dart';
import 'package:flutter_project/domain/models/movie_cart_models.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class MoviesRepository {
  final Function(String, String) onErrorHandler;

  late final Dio _dio;
  late final Database _db;

  MoviesRepository({required this.onErrorHandler}) {
    _dio = Dio()
      ..interceptors.addAll([
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
        ErrorInterceptor(onErrorHandler),
      ]);

    _db = Database();
  }

  Future<HomeModel?> loadData({required String q}) async {
    const String url = MovieQuery.baseUrl;
    final Response<dynamic> response = await _dio.get<List<dynamic>>(
      url,
      queryParameters: <String, dynamic>{'q': q},
    );

    final dtos = <ShowCardDTO>[];
    final responseList = response.data as List<dynamic>;
    for (final data in responseList) {
      dtos.add(ShowCardDTO.fromJson(data as Map<String, dynamic>));
    }

    final movieModels = <MovieCardModel>[];
    for (final dto in dtos) {
      movieModels.add(dto.toDomain());
    }

    final HomeModel model = HomeModel(results: movieModels);
    return model;
  }

  Future<List<MovieCardModel>> getAllMoviesDB() async {
    List<MovieTableData> moviesDB = await _db.select(_db.movieTable).get();
    return moviesDB
        .map((MovieTableData movieTableData) => movieTableData.toDomain())
        .toList();
  }

  Future<void> insertMovieDB(MovieCardModel movieCardModel) async {
    await _db.into(_db.movieTable).insert(
          movieCardModel.toDatabase(),
          mode: InsertMode.insertOrReplace,
        );
  }

  Future<void> deleteMovieDB(int id) async {
    await (_db.delete(_db.movieTable)
          ..where((movieTable) => movieTable.id.equals(id)))
        .go();
  }

  Stream<List<MovieCardModel>> onChangedMoviesDB() {
    return (_db.select(_db.movieTable))
        .map((MovieTableData movieTableData) => movieTableData.toDomain())
        .watch();
  }
}
