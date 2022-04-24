import 'package:flutter/material.dart';
import 'package:flutter_project/app/model/film_card_model.dart';
import 'package:flutter_project/app/widgets/film_card.dart';
import 'package:flutter_project/app/widgets/film_tile.dart';
import 'package:flutter_project/app/widgets/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// Основа нашего приложения
    return MaterialApp(
// Отображается над приложениями в Android, когда пользователь нажимает кнопку «последние приложения».
      title: 'Films',
// Стили всего приложения
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
// Наша начальная страница
      home: const MainPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: const _FilmList(),
    );
  }
}

class _FilmList extends StatelessWidget {
  const _FilmList({Key? key}) : super(key: key);

  static const List<FilmCardModel> _films = <FilmCardModel>[
    FilmCardModel(
      id: 1,
      title: 'Batmen',
      picture:
          'https://img1.akspic.ru/originals/8/2/9/5/6/165928-the_batman_2022_poster-2560x1440.jpg',
      voteAverage: 1.5,
      releaseDate: '20.06.1997',
      description: 'Богатый псих ловит психов победнее',
    ),
    FilmCardModel(
      id: 2,
      title: 'Superman',
      picture:
          'https://static2.srcdn.com/wordpress/wp-content/uploads/2018/01/Superman-Red-Son-Gotham-by-Gaslight-Animation.jpg',
      voteAverage: 4.5,
      releaseDate: '14.06.2013',
      description: 'Destroyed my planet, help destroy someone else',
    ),
    FilmCardModel(
      id: 3,
      title: 'Aquaman',
      picture:
          'https://cdn.fishki.net/upload/post/2019/03/27/2925512/bf388f6238417a1ee4b748f6c50da272.jpg',
      voteAverage: 5.5,
      releaseDate: '13.12.2018',
      description:
          'Вот что бывает, когда простой моряк начинает спать с русалками',
    ),
    FilmCardModel(
      id: 4,
      title: 'Catwoman',
      picture: 'https://gamebomb.ru/files/galleries/001/d/df/340189.jpg',
      voteAverage: 6.5,
      releaseDate: '20.06.1997',
      description: 'Женщина сошла с ума и решила что ей пора ловить мышей',
    ),
    FilmCardModel(
      id: 5,
      title: 'Antman',
      picture:
          'https://www.animatedtimes.com/wp-content/uploads/2021/01/peyton-reed-ant-man-3.jpg',
      voteAverage: 7.5,
      releaseDate: '14.06.2013',
      description: 'Мошеник выпивает элексир и начинает бухать с муровьями',
    ),
    FilmCardModel(
      id: 6,
      title: 'Ironman',
      picture: 'https://i.artfile.ru/2880x1800_807289_[www.ArtFile.ru].jpg',
      voteAverage: 8.5,
      releaseDate: '13.12.2018',
      description:
          'Мажор получает психологическую травму, собирает костюм из говна и палок и решает показать всем кто тут батя н а районе',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FilmCard.fromModel(model: _films[index % _films.length]),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
      ),
    );
  }
}
