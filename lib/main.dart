import 'package:flutter/material.dart';

enum Language { ru, en }

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

void main(filmsList) => runApp(const MaterialApp(
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
  List<Film> filmsList = [];
  List<Film> asyncList = [];

  @override
  void initState() {
    super.initState();
    filmsList = [
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
    ];

    for (final film in filmsList) {
      film.getFilm();
    }

    Future<void> asyncViewListFilms() async {
      await Future.delayed(const Duration(seconds: 3));
      setState(() {
        asyncList = [
          Film(
              id: '4',
              title: 'Catwoman',
              picture: 'assets/images/cat.jpg',
              voteAverage: 6.5,
              releaseDate: '20.06.1997',
              description:
                  'Женщина сошла с ума и решила что ей пора ловить мышей',
              language: 'ru'),
          Film(
              id: '5',
              title: 'Antman',
              picture: 'assets/images/ant.jpg',
              voteAverage: 7.5,
              releaseDate: '14.06.2013',
              description:
                  'Мощеник выпивает элексир и начинает бухать с муровьями',
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

        for (final film in asyncList) {
          film.getFilm();
        }

        filmsList.addAll(asyncList);
      });
    }

    asyncViewListFilms();
  }

  List allFilms = [
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

  final TextEditingController _rating = TextEditingController();

  @override
  void dispose() {
    _rating.dispose();
    super.dispose();
  }

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
                child: const Text(
                  'Movies',
                  style: TextStyle(
                    fontFamily: 'ChakraPetch-Medium',
                  ),
                )),
          ],
        ),
        actions: <Widget>[
          PopupMenuButton(
            icon: const Icon(Icons.filter),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: TextField(
                  controller: _rating,
                  // onChanged: (String value) {
                  //   _rating = value;
                  // },
                  style: const TextStyle(color: Colors.deepOrangeAccent),
                  cursorColor: Colors.deepOrangeAccent,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon:
                        const Icon(Icons.star, color: Colors.deepOrangeAccent),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          const BorderSide(color: Colors.deepOrangeAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          const BorderSide(color: Colors.deepOrangeAccent),
                    ),
                    hintText: 'Enter rating',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          PopupMenuButton(
            icon: const Icon(Icons.settings_applications_sharp),
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
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return Checkbox(
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  checkColor: Colors.white,
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                );
                              },
                            ),
                            const Text('Description'),
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
            icon: const Icon(Icons.language),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child:
                 StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                  return Column(
                  children: <Widget>[
                    RadioListTile<Language>(
                      title: const Text('Русский'),
                      activeColor: Colors.deepOrange,
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
                      activeColor: Colors.deepOrange,
                      value: Language.en,
                      groupValue: _languages,
                      onChanged: (Language? value) {
                        setState(() {
                          _languages = value;
                        });
                      },
                    ),
                  ],
                  );
                  },
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
              margin: const EdgeInsets.only(bottom: 2.0),
              child: Row(
                children: [
                  Image.asset(
                    filmsList[index].picture,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        filmsList[index].title,
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'ChakraPetch-Medium',
                        ),
                      ),
                      Text(
                        filmsList[index].language,
                        style: const TextStyle(
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
        child: const Icon(Icons.star_purple500_sharp),
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () => {
          filmsList = [],
          allFilms.forEach((film) {
            if (film.voteAverage >= double.parse(_rating.text)) {
              film.getFilm();
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
