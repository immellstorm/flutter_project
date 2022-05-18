import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/components/constants.dart';
import 'package:flutter_project/data/repositories/movies_repository.dart';
import 'package:flutter_project/domain/models/movie_cart_models.dart';
import 'package:flutter_project/presentation/home/bloc/home_event.dart';
import 'package:flutter_project/presentation/home/bloc/home_state.dart';
import 'package:collection/collection.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MoviesRepository repository;

  HomeBloc(this.repository) : super(HomeState(isEnLocale: false)) {
    on<LoadDataEvent>(_onLoadData);
    on<SearchChangedEvent>(_onSearchChanged);
    on<ChangedFavourites>(_onClickFavourites);
    on<ChangedMoviesDB>(_onChangedDB);

    repository
        .onChangedMoviesDB()
        .listen((List<MovieCardModel> changedMovieDB) {
      add(ChangedMoviesDB(models: changedMovieDB));
    });
  }

  String get search {
    final stateSearch = state.search;
    return (stateSearch != null && stateSearch.isNotEmpty)
        ? stateSearch
        : MovieQuery.initialQ;
  }

  void _onSearchChanged(SearchChangedEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(search: event.search));
    emit(state.copyWith(data: repository.loadData(q: search)));
    emit(state.copyWith(text: event.searchText));
  }

  void _onLoadData(LoadDataEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(data: repository.loadData(q: search)));
  }

  void _onClickFavourites(
      ChangedFavourites event, Emitter<HomeState> emit) async {
    final MovieCardModel? targetMovie = event.model;

    MovieCardModel? movie;
    if (state.favouritesMovies?.isNotEmpty == true) {
      movie = state.favouritesMovies
          ?.firstWhereOrNull((element) => element.id == targetMovie?.id);
    }

    if (movie != null) {
      await repository.deleteMovieDB(movie.id);
    } else if (targetMovie != null) {
      await repository.insertMovieDB(targetMovie);
    }
  }

  void _onChangedDB(ChangedMoviesDB event, Emitter<HomeState> emit) {
    emit(state.copyWith(favouritesMovies: event.models));
  }
}
