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

  @override
  String get bad => ' Bad';

  @override
  String get good => 'Good';

  @override
  String get excellent => 'Excellent';

  @override
  String get settings => 'Settings';

  @override
  String get back => 'Back';

  @override
  String get exit => 'Exit';

  @override
  String get getName => 'Get name';

  @override
  String get saveName => 'Save name';

  @override
  String get clearName => 'Clear name';
}
