import 'package:flutter_project/components/locals/locale_base.dart';

class LocaleEn implements LocaleBase {
  @override
  String get error => 'Error';

  @override
  String get unknown => 'Unknown';

  @override
  String get ratingPrefix => 'Rating: ';

  @override
  String get ratingSuffix => '/ 10';

  @override
  String get search => 'Search';

  @override
  String get switchLanguage => 'Switch language';

  @override
  String get addFavourites => 'Add to wishlist';

  @override
  String get deleteFavourites => 'Delete from Wishlist';

  @override
  String get movies => 'Movies';

  @override
  String get wishlist => ' Wishlist';
}
