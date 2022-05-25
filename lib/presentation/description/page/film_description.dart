import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/components/constants.dart';
import 'package:flutter_project/components/locals/locals.dart';
import 'package:flutter_project/presentation/description/page/description_page.dart';

class FilmDescription extends StatelessWidget {
  const FilmDescription({required this.arguments, Key? key}) : super(key: key);

  final DescriptionArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 2,
          child: CachedNetworkImage(
            imageUrl: '${arguments.picture}',
            fit: BoxFit.cover,
            width: double.infinity,
            errorWidget: (_, __, ___) =>
                Image.network(MovieQuery.pisecImageUrl),
            cacheManager: MoviePictures.pictureCache,
          ),
        ),
        Flexible(
            flex: 2,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ),
                            Expanded(
                              // оборачиваем наш текст в Expanded как указано в сообщении
                              child: Text(
                                '${(context.locale.ratingPrefix)}  ${(arguments.voteAverage! * 10).toInt()}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.deepOrangeAccent),
                                overflow: TextOverflow
                                    .ellipsis, // и ограничиваем тремя точками в конце.
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 8),
                        child: Text(
                          '${(context.locale.relaseData)}:  ${arguments.releaseDate}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Text(
                        '${arguments.description}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
    //   Container(
    //   child: Text('${arguments.title}'),
    // );
    // return Column(
    //   children: [
    //     BlocBuilder<HomeBloc, HomeState>(
    //       builder: (context, state) {
    //         return FutureBuilder<HomeModel?>(
    //           future: state.data,
    //           builder: (BuildContext context, AsyncSnapshot<HomeModel?> data) =>
    //               Expanded(
    //             child: ListView.builder(
    //               itemBuilder: (BuildContext context, int index) {
    //                 return MovieCard(
    //                   textButton: 'text',
    //                   movieCardModel: data.data?.results![arguments.id],
    //                   key: ValueKey<int>(
    //                       data.data?.results?[arguments.id].id ?? -1),
    //                 );
    //               },
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   ],
    // );
  }
}

// Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
//       builder: (context, state) {
//         return FutureBuilder<HomeModel?>(
//             future: state.data,
//             builder: (BuildContext context, AsyncSnapshot<HomeModel?> data) {
//               return MovieCard(
//                 movieCardModel: data.data?.results?[arguments.id],
//                 key:
//                     ValueKey<int>(data.data?.results?[arguments.id].id ?? -1),
//                 textButton: 'text',
//               );
//             });
//       },
//     );
