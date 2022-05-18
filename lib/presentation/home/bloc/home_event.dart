import 'package:equatable/equatable.dart';
import 'package:flutter_project/domain/models/movie_cart_models.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SearchChangedEvent extends HomeEvent {
  final String search;
  final String searchText;

  const SearchChangedEvent({required this.search, required this.searchText});

  @override
  List<Object> get props => [search, searchText];
}

class LoadDataEvent extends HomeEvent {}

class ChangedFavourites extends HomeEvent {
  final MovieCardModel? model;

  const ChangedFavourites({required this.model});
}

class ChangedMoviesDB extends HomeEvent {
  final List<MovieCardModel> models;

  const ChangedMoviesDB({required this.models});
}
