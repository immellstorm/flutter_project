import 'package:flutter/material.dart';
import 'package:flutter_project/components/constants.dart';
import 'package:flutter_project/data/repositories/movies_repository.dart';
import 'package:flutter_project/domain/models/home_model.dart';
import 'package:flutter_project/presentation/home/movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<HomeModel?>? dataLoadingState;

  @override
  Widget build(BuildContext context) {
    dataLoadingState ??=
        MoviesRepository.loadData(context, q: MovieQuery.initialQ);
    return SafeArea(
      child: FutureBuilder<HomeModel?>(
        future: dataLoadingState,
        builder: (BuildContext context, AsyncSnapshot<HomeModel?> data) {
          return data.connectionState != ConnectionState.done
              ? const Center(child: CircularProgressIndicator())
              : data.hasData
                  ? ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return MovieCard(
                          movieCardModel: data.data?.results?[index],
                          key: ValueKey<int>(
                              data.data?.results?[index].id ?? -1),
                        );
                      },
                      itemCount: data.data?.results?.length ?? 0,
                    )
                  : Image.network(MovieQuery.pisecImageUrl, fit: BoxFit.cover);
        },
      ),
    );
  }
}
