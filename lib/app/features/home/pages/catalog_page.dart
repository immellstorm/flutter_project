import 'package:flutter/material.dart';
import 'package:flutter_project/app/features/home/widgets/film_grid.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/filter',
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/settings',
              );
            },
          ),
        ],
      ),
      body: const FilmGrid(),
    );
  }
}