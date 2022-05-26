import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/description/page/film_description.dart';

class DescriptionArguments {
  const DescriptionArguments(
      this.id,
      this.title,
      this.picture,
      this.releaseDate,
      this.voteAverage,
      this.description,
      this.originLanguage,
      this.officialSite,
      this.ended);

  final int id;
  final String title;
  final String? picture;
  final String? releaseDate;
  final double? voteAverage;
  final String? description;
  final String? originLanguage;
  final String? officialSite;
  final String? ended;
}

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({required this.arguments, Key? key}) : super(key: key);
  final DescriptionArguments arguments;
  static const path = '/description';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          arguments.title,
        ),
      ),
      body: FilmDescription(
        arguments: arguments,
      ),
    );
  }
}
