import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/home/home_page.dart';

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
