import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/components/constants.dart';
import 'package:flutter_project/components/locals/locals.dart';
import 'package:flutter_project/domain/models/home_model.dart';
import 'package:flutter_project/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_project/presentation/home/bloc/home_event.dart';
import 'package:flutter_project/presentation/home/bloc/home_state.dart';
import 'package:flutter_project/presentation/home/movie_card.dart';
import 'package:flutter_project/presentation/settings/pages/settings_page.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
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
        resizeToAvoidBottomInset: true,
        backgroundColor: MovieColors.greyColor,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/mad.png',
                fit: BoxFit.contain,
                height: 32,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Movies')),
            ],
          ),
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
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              onRefresh();
            });
          },
          child: Column(
            children: [
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
                              //? data.data?.results?.isNotEmpty == true
                              ? state.favouritesMovies?.isNotEmpty == true
                                  ? Expanded(
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount:
                                            state.favouritesMovies!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return MovieCard(
                                            textButton:
                                                context.locale.deleteFavourites,
                                            onClickFavoriteButton: () {
                                              context.read<HomeBloc>().add(
                                                    ChangedFavourites(
                                                      model: state
                                                              .favouritesMovies![
                                                          index],
                                                    ),
                                                  );
                                            },
                                            movieCardModel:
                                                state.favouritesMovies![index],
                                            key: ValueKey<int>(state
                                                .favouritesMovies![index].id),
                                          );
                                        },
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
