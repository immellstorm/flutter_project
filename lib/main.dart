import 'package:flutter/material.dart';

enum Language { ru, en }

/* LanguageConversion mixin, conversion sting to enum */
mixin LanguageConversion {
  enumFromString(String language) {
    switch (language) {
      case 'ru':
        return Language.ru;
      case 'en':
        return Language.en;
    }
  }
}

/* LanguageParsing extention on Language*/
extension LanguageParsing on Language {
  String toPrettyString() {
    switch (this) {
      case Language.ru:
        return 'Русский';
      case Language.en:
        return 'Английский';
      default:
        return 'Нет такого языка';
    }
  }
}

/* Characteristics class
 * @constructor
 */
abstract class Characteristics {
  Characteristics(this.id, this.title, this.picture, this.voteAverage,
      this.releaseDate, this.description, this.language);

  final String id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;
  String language;

  void getFilm();
}

/* Film class
 * @method display show film characteristics
 * @constructor
 */
class Film extends Characteristics with LanguageConversion {
  Film(
      {required String id,
      required String title,
      required String picture,
      required double voteAverage,
      required String releaseDate,
      required String description,
      required String language})
      : super(id, title, picture, voteAverage, releaseDate, description,
            language);

  @override
  void getFilm() {
    Language lang = enumFromString(language);
    language = lang.toPrettyString();
  }
}

class FilmCart extends StatelessWidget {
  const FilmCart(
      {Key? key,
      required this.id,
      required this.title,
      required this.picture,
      required this.voteAverage,
      required this.releaseDate,
      required this.description,
      required this.language})
      : super(key: key);

  final String id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.orange,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(picture),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'title: ' + title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'ChakraPetch-Medium',
                      ),
                    ),
                    Text(
                      'voteAverage: ' + voteAverage.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'ChakraPetch-Medium',
                      ),
                    ),
                    Text(
                      'releaseDate: ' + releaseDate,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'ChakraPetch-Medium',
                      ),
                    ),
                    Text(
                      'description: ' + description,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'ChakraPetch-Medium',
                      ),
                    ),
                    Text(
                      'language: ' + language,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'ChakraPetch-Medium',
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.deepOrange),
        fontFamily: 'ChakraPetch-Medium',
      ),
      home: const HomePage(),
    );
  }
}

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
