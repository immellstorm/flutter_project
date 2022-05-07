import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/components/constants.dart';
import 'package:flutter_project/components/delayed_action.dart';
import 'package:flutter_project/domain/models/home_model.dart';
import 'package:flutter_project/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_project/presentation/home/bloc/home_event.dart';
import 'package:flutter_project/presentation/home/bloc/home_state.dart';
import 'package:flutter_project/presentation/home/movie_card.dart';
import 'package:flutter_project/presentation/settings/pages/settings_page.dart';
import 'package:collection/collection.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final TextEditingController textController = TextEditingController();

  @override
  void didChangeDependencies() {
    context.read<HomeBloc>().add(LoadDataEvent());
    super.didChangeDependencies();
  }

  void onRefresh() {
    context.read<HomeBloc>().add(LoadDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  SettingsPage.path,
                );
              },
            ),
          ],
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: MovieColors.backgroundBlackColor,
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              onRefresh();
            });
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: TextField(
                  controller: textController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    labelText: MovieLocal.search,
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: _onSearchFieldTextChanged,
                ),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (oldState, newState) =>
                    oldState.data != newState.data ||
                    oldState.favouritesMovies != newState.favouritesMovies,
                builder: (context, state) {
                  return FutureBuilder<HomeModel?>(
                    future: state.data,
                    builder:
                        (BuildContext context, AsyncSnapshot<HomeModel?> data) {
                      return data.connectionState != ConnectionState.done
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : data.hasData
                              ? data.data?.results?.isNotEmpty == true
                                  ? Expanded(
                                      child: ListView.builder(
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          // проверяем есть ли элемент в избранном
                                          bool isFavourite = false;
                                          if (state.favouritesMovies
                                                  ?.isNotEmpty ==
                                              true) {
                                            var moviesFavourite = state
                                                .favouritesMovies
                                                ?.firstWhereOrNull((element) =>
                                                    element.id ==
                                                    data.data?.results?[index]
                                                        .id);
                                            if (moviesFavourite != null) {
                                              isFavourite = true;
                                            }
                                          }

                                          return MovieCard(
                                            textButton: isFavourite
                                                ? MovieLocal.deleteFavourites
                                                : MovieLocal.addFavourites,
                                            onClickFavoriteButton: () {
                                              context.read<HomeBloc>().add(
                                                    ChangedFavourites(
                                                      model: data.data
                                                          ?.results?[index],
                                                    ),
                                                  );
                                            },
                                            movieCardModel:
                                                data.data?.results?[index],
                                            key: ValueKey<int>(
                                                data.data?.results?[index].id ??
                                                    -1),
                                          );
                                        },
                                        itemCount:
                                            data.data?.results?.length ?? 0,
                                      ),
                                    )
                                  : const _Empty()
                              : const _Error();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSearchFieldTextChanged(String text) {
    DelayedAction.run(() {
      context.read<HomeBloc>().add(SearchChangedEvent(search: text));
    });
  }
}

class _Error extends StatelessWidget {
  const _Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(MovieQuery.pisecImageUrl, fit: BoxFit.cover);
  }
}

class _Empty extends StatelessWidget {
  const _Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(MovieQuery.nothingImageUrl, fit: BoxFit.cover);
  }
}
