import 'package:flutter/material.dart';

enum Language {
  ru,
  en,
}

/* Characteristics class
 * @constructor
 */
abstract class Characteristics {
  final String id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;
  String language;

  Characteristics(this.id, this.title, this.picture, this.voteAverage,
      this.releaseDate, this.description, this.language);
}

/* LanguageConversion mixin, conversion sting to enum */
mixin LanguageConversion {
  enumFromString(language) {
    switch (language) {
      case 'ru':
        return Language.ru;
      case 'en':
        return Language.en;
    }
  }
}

/* Film class
 * @constructor
 */
class Film extends Characteristics with LanguageConversion {
  Film(String id, String title, String picture, double voteAverage,
      String releaseDate, String description, String language)
      : super(id, title, picture, voteAverage, releaseDate, description,
            language) {
    Language lang = enumFromString(this.language);
    this.language = lang.toPrettyString();
  }
}

/* LanguageParsing extention on Language*/
extension LanguageParsing on Language {
  toPrettyString() {
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

void main(filmsList) => runApp(MaterialApp(
  home: UserPanel(),
));

class UserPanel extends StatefulWidget {
  const UserPanel({Key? key}) : super(key: key);

  @override
  State<UserPanel> createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {
  bool isChecked = false;
  Language? _languages;
  String? _rating;
  List filmsList = [];

  @override
  void initState() {
    super.initState();
    filmsList = [
      Film('1', 'Batmen', 'assets/images/1920x.webp', 2.0, '20.06.1997',
          'Главный герой будучи психом, сам ловит таких же психов', 'ru'),
      Film('2', 'Superman', 'assets/images/sup.jpg', 5.0, '14.06.2013',
          'Destroyed my planet, help destroy someone else', 'en'),
      Film(
          '3',
          'Aquaman',
          'assets/images/aqua.jpg',
          7.0,
          '13.12.2018',
          'Вот что бывает, когда простой моряк начинает спать с русалками',
          'ru'),
    ];

    final asyncFilm = Film('4', 'The Avengers', 'assets/images/mst.jpeg', 9.0,
        '11.04.1997', 'Пачка бомжей собираются устроить кутеж', 'en');

    _viewAsyncFilm() async {
      await new Future.delayed(const Duration(seconds: 2));
      setState(() {
        filmsList.add(asyncFilm);
      });
    }

    _viewAsyncFilm();
  }

  List allFilms = [
    Film('1', 'Batmen', 'assets/images/1920x.webp', 2.0, '20.06.1997',
        'Главный герой будучи психом, сам ловит таких же психов', 'ru'),
    Film('2', 'Superman', 'assets/images/sup.jpg', 5.0, '14.06.2013',
        'Destroyed my planet, help destroy someone else', 'en'),
    Film('3', 'Aquaman', 'assets/images/aqua.jpg', 7.0, '13.12.2018',
        'Вот что бывает, когда простой моряк начинает спать с русалками', 'ru'),
    Film('4', 'The Avengers', 'assets/images/mst.jpeg', 9.0, '11.04.1997',
        'Пачка бомжей собираются устроить кутеж', 'en'),
  ];

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
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
                child: Text(
                  'Movies',
                  style: TextStyle(
                    fontFamily: 'ChakraPetch-Medium',
                  ),
                )),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.filter),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: TextField(
                  //controller: getRating,
                  onChanged: (String value) {
                    _rating = value;
                  },
                  style: TextStyle(color: Colors.deepOrangeAccent),
                  cursorColor: Colors.deepOrangeAccent,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon:
                        const Icon(Icons.star, color: Colors.deepOrangeAccent),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.deepOrangeAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.deepOrangeAccent),
                    ),
                    hintText: 'Enter rating',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          PopupMenuButton(
            icon: Icon(Icons.settings_applications_sharp),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Column(
                  children: <Widget>[
                    Column(
                      children: [
                        Row(
                          children: [
                            StatefulBuilder(
                              builder: (BuildContext context, StateSetter setState) {
                               return Checkbox(
                                  fillColor: MaterialStateProperty.resolveWith(getColor),
                                  checkColor: Colors.white,
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                );
                              },),
                              Text('Description'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          PopupMenuButton(
            icon: Icon(Icons.language),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Column(
                  children: <Widget>[
                    RadioListTile<Language>(
                      title: const Text('Русский'),
                      value: Language.ru,
                      groupValue: _languages,
                      onChanged: (Language? value) {
                        setState(() {
                          _languages = value;
                        });
                      },
                    ),
                    RadioListTile<Language>(
                      title: const Text('Английский'),
                      value: Language.en,
                      groupValue: _languages,
                      onChanged: (Language? value) {
                        setState(() {
                          _languages = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: filmsList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.black,
              margin: EdgeInsets.only(bottom: 2.0),
              child: Row(
                children: [
                  Image.asset(
                    filmsList[index].picture,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        filmsList[index].title,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'ChakraPetch-Medium',
                        ),
                      ),
                      Text(
                        filmsList[index].language,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'ChakraPetch-Medium',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star_purple500_sharp),
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () => {
          //filterFilmsList = filmsList,
          filmsList = [],
          allFilms.forEach((film) {
            if (film.voteAverage >= double.parse(_rating!)) {
              setState(() {
                filmsList.add(film);
              });
            }
          }),
        },
      ),
    );
  }
}
