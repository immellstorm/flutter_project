import 'package:flutter/material.dart';
import 'package:flutter_project/app/features/home/pages/description_page.dart';
import 'package:flutter_project/app/model/film_card_model.dart';
import 'package:flutter_project/app/widgets/buttons/primary_button.dart';
import 'package:flutter_project/app/widgets/image_network.dart';

class FilmCard extends StatelessWidget {
  FilmCard({
    required this.id,
    required this.title,
    required this.picture,
    required this.voteAverage,
    Key? key,
  }) : super(key: key);

  factory FilmCard.fromModel({
    required FilmCardModel model,
    Key? key,
  }) {
    return FilmCard(
      id: model.id,
      title: model.title,
      picture: model.picture,
      voteAverage: model.voteAverage,
      key: key,
    );
  }

  final int id;
  final String title;
  final String picture;
  final double voteAverage;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            offset: Offset(1, 2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ImageNetwork(
                picture,
              ),
            ),
          ),
          Positioned(
            right: 4,
            top: 4,
            child: _RatingChip(voteAverage),
          ),
          Positioned(
            left: 4,
            top: 4,
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      isPressed = !isPressed;
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    size: 30,
                    color: isPressed ? Colors.deepPurple : Colors.white,
                  ),
                );
              },
            ),
          ),
          Positioned(
            child: ClipRRect(
              child: Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(3.0, 3.0),
                      blurRadius: 2.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            top: 50,
            left: 20,
            right: 20,
          ),
          Positioned(
            left: 8,
            right: 8,
            bottom: 8,
            child: PrimaryButton('More', onPressed: () {
              Navigator.pushNamed(
                context,
                '/description',
                arguments: DescriptionArguments(id),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _RatingChip extends StatelessWidget {
  const _RatingChip(this.voteAverage, {Key? key}) : super(key: key);

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(
        Icons.star,
        color: Colors.yellow,
      ),
      label: Text(
        voteAverage.toStringAsFixed(1),
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
