import 'package:flutter/material.dart';

// basic
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
  final String language;

  Characteristics(this.id, this.title, this.picture, this.voteAverage, this.releaseDate, this.description, this.language);
}

/* LanguageConversion mixin, conversion sting to enum */
mixin LanguageConversion {
  enumFromString(language){
    switch(language){
      case 'ru':
        return Language.ru;
      case 'en':
        return Language.en;
    }
  }
}

/* Film class
 * @method display show film characteristics
 * @constructor
 */
class Film extends Characteristics with LanguageConversion {
  Film(String id, String title, String picture, double voteAverage, String releaseDate, String description, String language) : super(id, title, picture, voteAverage, releaseDate, description, language);

  void display(){
    Language lang = enumFromString(language);
    final prettyLang = lang.toPrettyString();
    print("id: $id title: $title picture: $picture voteAverage: $voteAverage, releaseDate: $releaseDate, description: $description, language: $prettyLang)");
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

// pro
/* Function view  async films list*/
Future<void> displayViewListFilms(List filmsList) async {
  await Future.delayed(Duration(seconds: 3));
  for (var item in filmsList) {
     item.display();
  }
}

/* Function filter and return list by voteAverage */
void filtrationByRating(List allFilms, double value) {
  List filteredResult = [];
  for (final film in allFilms) {
    if (film.voteAverage >= value) {
      filteredResult.add(film.title);
    }
  }
  print(filteredResult);

  return;
}

void main() {
  // basic
  final batman  = Film('1','batmen', 'mouse is flying', 1.5, '20 сентября', 'мышь сдохла', 'en');
  batman.display();
  final Language prattylang = Language.ru;
  print(prattylang.toPrettyString());

  // pro
  List<Film> filmsList = [
    Film('1','Batmen', 'https://upload.wikimedia.org/wikipedia/ru/thumb/a/a2/Batman_%26_robin_poster.jpg/196px-Batman_%26_robin_poster.jpg', 1.5, '20.06.1997', 'Главный герой будучи психом, сам ловит таких же психов', 'ru'),
    Film('2','Super-man', 'https://upload.wikimedia.org/wikipedia/en/5/50/Man_of_Steel_%28film%29_poster.jpg', 2.5, '14.06.2013', 'Destroyed my planet, help destroy someone else', 'en'),
    Film('3','Aqua-man', 'https://upload.wikimedia.org/wikipedia/ru/thumb/0/0a/%D0%90%D0%BA%D0%B2%D0%B0%D0%BC%D0%B5%D0%BD.jpg/223px-%D0%90%D0%BA%D0%B2%D0%B0%D0%BC%D0%B5%D0%BD.jpg', 3.5, '13.12.2018', 'Вот что бывает, когда простой моряк начинает спать с русалками', 'ru'),
  ];
  displayViewListFilms(filmsList);
  filtrationByRating(filmsList, 2.5);
}