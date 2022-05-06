import 'package:flutter/material.dart';
import 'package:flutter_project/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Film> movies = [];
  bool isChecked = false;

  @override
  void initState() {
    _getFilms().then((value) {
      setState(() {
        movies = value;
      });
    });
    super.initState();
  }

  Future<List<Film>> _getFilms() async {
    await Future.delayed(const Duration(seconds: 1));
    List<Film> filmsList = [
      Film(
          id: '1',
          title: 'Batmen',
          picture: 'assets/images/1920x.webp',
          voteAverage: 1.5,
          releaseDate: '20.06.1997',
          description: 'Богатый псих ловит психов победнее',
          language: 'en'),
      Film(
          id: '2',
          title: 'Superman',
          picture: 'assets/images/sup.jpg',
          voteAverage: 4.5,
          releaseDate: '14.06.2013',
          description: 'Destroyed my planet, help destroy someone else',
          language: 'en'),
      Film(
          id: '3',
          title: 'Aquaman',
          picture: 'assets/images/aqua.jpg',
          voteAverage: 5.5,
          releaseDate: '13.12.2018',
          description:
              'Вот что бывает, когда простой моряк начинает спать с русалками',
          language: 'ru'),
      Film(
          id: '4',
          title: 'Catwoman',
          picture: 'assets/images/cat.jpg',
          voteAverage: 6.5,
          releaseDate: '20.06.1997',
          description: 'Женщина сошла с ума и решила что ей пора ловить мышей',
          language: 'ru'),
      Film(
          id: '5',
          title: 'Antman',
          picture: 'assets/images/ant.jpg',
          voteAverage: 7.5,
          releaseDate: '14.06.2013',
          description: 'Мощеник выпивает элексир и начинает бухать с муровьями',
          language: 'en'),
      Film(
          id: '6',
          title: 'Ironman',
          picture: 'assets/images/iron.jpg',
          voteAverage: 8.5,
          releaseDate: '13.12.2018',
          description:
              'Вот что бывает, когда простой моряк начинает спать с русалками',
          language: 'ru'),
    ];

    for (final film in filmsList) {
      film.getFilm();
    }

    return filmsList;
  }

  @override
  Widget build(BuildContext context) {
    Color _getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.orange;
      }
      return Colors.black;
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/mad.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Movies',
                  style: TextStyle(
                    fontFamily: 'ChakraPetch-Medium',
                  ),
                )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: Colors.orange,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            fillColor:
                                MaterialStateProperty.resolveWith(_getColor),
                            value: isChecked,
                            onChanged: (bool? changeValue) {
                              setState(() {
                                isChecked = changeValue ?? false;
                              });
                            }),
                        const Text(
                          'Рейтинг больше 5',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'ChakraPetch-Medium',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      child: ElevatedButton.icon(
                        onPressed: filterFilms,
                        label: const Text('Поиск'),
                        icon: const Icon(Icons.search_off),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'ChakraPetch-Medium')),
                      ),
                    ),
                  ],
                )),
            ...List.generate(movies.length, (index) {
              return FilmCart(
                id: movies[index].id,
                title: movies[index].title,
                picture: movies[index].picture,
                voteAverage: movies[index].voteAverage,
                releaseDate: movies[index].releaseDate,
                description: movies[index].description,
                language: movies[index].language,
              );
            }),
          ],
        ),
      ),
    );
  }

  Future<void> filterFilms() async {
    await _getFilms().then((valueFilms) {
      setState(() {
        if (isChecked) {
          movies =
              valueFilms.where((element) => element.voteAverage > 5).toList();
        } else {
          movies = valueFilms;
        }
      });
    });
  }
}
