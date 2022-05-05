import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/components/constants.dart';
import 'package:flutter_project/components/dialogs/error_dialog.dart';
import 'package:flutter_project/data/dtos/show_card_dto.dart';
import 'package:flutter_project/data/mappers/show_mapper.dart';
import 'package:flutter_project/domain/models/home_model.dart';
import 'package:flutter_project/domain/models/movie_cart_models.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class MoviesRepository {
  static final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));

  static Future<HomeModel?> loadData(
    BuildContext context, {
    required String q,
  }) async {
    try {
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
    } on DioError catch (error) {
      final statusCode = error.response?.statusCode;
      showErrorDialog(context, error: statusCode?.toString() ?? '');
      return null;
    }
  }
}
