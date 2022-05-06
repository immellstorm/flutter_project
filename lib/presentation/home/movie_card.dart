import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_project/components/constants.dart';
import 'package:flutter_project/components/widgets/primary_button.dart';
import 'package:flutter_project/domain/models/movie_cart_models.dart';

class MovieCard extends StatelessWidget {
  final MovieCardModel? movieCardModel;
  final VoidCallback? onClickFavoriteButton;
  final String textButton;

  const MovieCard({
    this.movieCardModel,
    this.onClickFavoriteButton,
    required this.textButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: MovieColors.cardBlackColor,
              ),
              child: CachedNetworkImage(
                imageUrl: '${movieCardModel?.picture}',
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) =>
                    Image.network(MovieQuery.pisecImageUrl),
                cacheManager: MoviePictures.pictureCache,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Text(
              '${movieCardModel?.title} (${movieCardModel?.releaseDate})',
              textAlign: TextAlign.justify,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Text(
            _rating(movieCardModel?.voteAverage ?? 0),
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child:
                // Html(data: movieCardModel?.description ?? ''),
                PrimaryButton(
              textButton,
              onPressed: () {
                //Вызываем функци обратного вызова
                onClickFavoriteButton?.call();
              },
            ),
          )
        ],
      ),
    );
  }

  String _rating(double voteAverage) {
    const prefix = MovieLocal.ratingPrefix;
    const suffix = MovieLocal.ratingSuffix;
    final rating = (voteAverage * 10).toInt();
    return '$prefix $rating $suffix';
  }
}
