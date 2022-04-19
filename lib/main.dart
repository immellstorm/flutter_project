import 'package:flutter/material.dart';

// basic
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
  const Characteristics(this.id, this.title, this.picture, this.voteAverage,
      this.releaseDate, this.description, this.language);

  final String id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;
  final String language;

  void getFilm();
}

/* Film class
 * @method display show film characteristics
 * @constructor
 */
class Film extends Characteristics with LanguageConversion {
  const Film(
      {required String id,
      required String title,
      required String picture,
      required double voteAverage,
      required String releaseDate,
      required String description,
      required String language})
      : super(id, title, picture, voteAverage, releaseDate, description,
            language);

  void getFilm() {
    Language lang = enumFromString(language);
    print("id: $id title: $title picture: $picture voteAverage: $voteAverage, releaseDate: $releaseDate, description: $description, language: ${lang.toPrettyString()})");
  }
}

// pro
/* Function view  async films list*/
Future<void> asyncViewListFilms(List filmsList) async {
  await Future.delayed(Duration(seconds: 1));
  for (var item in filmsList) {
    item.getFilm();
  }
}

void main() {
  print('-------basic-----');
  Film batman = const Film(
      id: '1',
      title: 'batmen',
      picture: 'assets/images/1920x.webp',
      voteAverage: 1.5,
      releaseDate: '20.06.1997',
      description: 'мышь сдохла',
      language: 'en');

  batman.getFilm();

  List<Film> _getFilmsList() {
    return [
      const Film(
          id: '1',
          title: 'Batmen',
          picture: 'assets/images/1920x.webp',
          voteAverage: 1.5,
          releaseDate: '20.06.1997',
          description: 'Богатый псих ловит психов победнее',
          language: 'en'),
      const Film(
          id: '2',
          title: 'Superman',
          picture:
              'https://upload.wikimedia.org/wikipedia/en/5/50/Man_of_Steel_%28film%29_poster.jpg',
          voteAverage: 4.5,
          releaseDate: '14.06.2013',
          description: 'Destroyed my planet, help destroy someone else',
          language: 'en'),
      const Film(
          id: '3',
          title: 'Aquaman',
          picture:
              'https://upload.wikimedia.org/wikipedia/ru/thumb/0/0a/%D0%90%D0%BA%D0%B2%D0%B0%D0%BC%D0%B5%D0%BD.jpg/223px-%D0%90%D0%BA%D0%B2%D0%B0%D0%BC%D0%B5%D0%BD.jpg',
          voteAverage: 5.5,
          releaseDate: '13.12.2018',
          description:
              'Вот что бывает, когда простой моряк начинает спать с русалками',
          language: 'ru'),
    ];
  }

  List<Film> filmsList = _getFilmsList();

  for (final film in filmsList) {
    film.getFilm();
  }

  // pro
  print('-------pro-----');
  asyncViewListFilms(filmsList);

  for(final film in filmsList) {
    film.getFilm();
  }

  List<Film> _filteredFilms(List<Film> allFilms) {
    print('-------filtered list-----');
    return allFilms.where((element) => element.voteAverage > 5).toList();
  }

  List<Film> filterdFilms = _filteredFilms(filmsList);

  for(final film in filterdFilms) {
    film.getFilm();
  }
}
