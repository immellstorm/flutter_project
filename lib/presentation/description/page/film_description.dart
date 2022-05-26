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
            errorWidget: (_, __, ___) => Image.network(MovieQuery.noImageUrl),
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
                                color: Colors.deepOrangeAccent,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${(context.locale.ratingPrefix)}  ${(arguments.voteAverage! * 10).toInt()}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.deepOrangeAccent),
                                overflow: TextOverflow.ellipsis,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          '${(context.locale.endedData)}:  ${arguments.ended}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          '${(context.locale.originLanguage)}:  ${arguments.originLanguage}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          '${(context.locale.officialSite)}:  ${arguments.officialSite}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 8),
                        child: Text(
                          removeAllHtmlTags(
                            '${arguments.description}',
                          ),
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}
