import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/components/constants.dart';
import 'package:flutter_project/components/locals/locals.dart';
import 'package:flutter_project/components/widgets/primary_button.dart';
import 'package:flutter_project/domain/models/movie_cart_models.dart';

class MovieCard extends StatelessWidget with GradeConversion {
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
            _rating(context, movieCardModel?.voteAverage ?? 0),
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: PrimaryButton(
              textButton,
              onPressed: () {
                onClickFavoriteButton?.call();
              },
            ),
          )
        ],
      ),
    );
  }

  String _rating(BuildContext context, double voteAverage) {
    final prefix = context.locale.ratingPrefix;
    final suffix = context.locale.ratingSuffix;
    final rating = (voteAverage * 10).toInt();
    String grade = '';
    String gradeLocale = '';
    Grade gradeEnum = enumFromString(rating);
    grade = gradeEnum.toGradeString();

    if (grade == 'Bad') {
      gradeLocale = context.locale.bad;
    } else if (grade == 'Good') {
      gradeLocale = context.locale.good;
    } else {
      gradeLocale = context.locale.excellent;
    }

    return '$prefix $rating $suffix $gradeLocale';
  }
}

enum Grade { Bad, Good, Excellent }

extension GradeParsing on Grade {
  String toGradeString() {
    switch (this) {
      case Grade.Bad:
        return 'Bad';
      case Grade.Good:
        return 'Good';
      case Grade.Excellent:
        return 'Excellent';
    }
  }
}

mixin GradeConversion {
  enumFromString(int rating) {
    switch (rating) {
      case 1:
        return Grade.Bad;
      case 2:
        return Grade.Bad;
      case 3:
        return Grade.Bad;
      case 4:
        return Grade.Bad;
      case 5:
        return Grade.Good;
      case 6:
        return Grade.Good;
      case 7:
        return Grade.Good;
      case 8:
        return Grade.Excellent;
      case 9:
        return Grade.Excellent;
      case 10:
        return Grade.Excellent;
    }
  }
}
