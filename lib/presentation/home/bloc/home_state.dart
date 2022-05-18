import 'package:equatable/equatable.dart';
import 'package:flutter_project/domain/models/home_model.dart';
import 'package:flutter_project/domain/models/movie_cart_models.dart';

class HomeState extends Equatable {
  final String? search;
  final Future<HomeModel?>? data;
  final List<MovieCardModel>? favouritesMovies;
  bool isEnLocale = false;
  final String? text;

  HomeState({
    this.search,
    this.data,
    this.favouritesMovies,
    required this.isEnLocale,
    this.text,
  });

  HomeState copyWith({
    String? search,
    Future<HomeModel?>? data,
    List<MovieCardModel>? favouritesMovies,
    bool? isEnLocale,
    String? text,
  }) =>
      HomeState(
          search: search ?? this.search,
          data: data ?? this.data,
          favouritesMovies: favouritesMovies ?? this.favouritesMovies,
          isEnLocale: isEnLocale ?? this.isEnLocale,
          text: text ?? this.text);

  @override
  List<Object> get props => [
        search ?? 0,
        data ?? 0,
        favouritesMovies ?? [],
        isEnLocale,
        text ?? 0,
      ];
}
