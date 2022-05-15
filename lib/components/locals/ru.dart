import 'package:flutter_project/components/locals/locale_base.dart';

class LocaleRu implements LocaleBase {
  @override
  String get error => 'Ошибка';

  @override
  String get unknown => 'Неизвестно';

  @override
  String get ratingPrefix => 'Оценка: ';

  @override
  String get ratingSuffix => '/ 10';

  @override
  String get search => 'Поиск';

  @override
  String get switchLanguage => 'Сменить язык';

  @override
  String get addFavourites => 'Добавить в избранное';

  @override
  String get deleteFavourites => 'Удалить из избранного';

  @override
  String get movies => 'Фильмы';

  @override
  String get wishlist => 'Избранное';

  @override
  String get bad => 'Плохо';

  @override
  String get good => 'Хорошо';

  @override
  String get excellent => 'Отлично';

  @override
  String get settings => 'Настройки';

  @override
  String get back => 'Назад';

  @override
  String get exit => 'Выход';

  @override
  String get getName => 'Получить имя';

  @override
  String get saveName => 'Сохранить имя';

  @override
  String get clearName => 'Очистить имя';
}
