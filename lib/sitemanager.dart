import 'package:shared_preferences/shared_preferences.dart';

class SiteManager {
  late SharedPreferences _prefs;
  Set<int> _favoriteIndices = {};

  SiteManager() {
    _loadFavoriteIndicesFromSharedPreferences();
  }

  Future<void> _loadFavoriteIndicesFromSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    final favoriteIndices = _prefs
            .getStringList('favorite_sites')
            ?.map((index) => int.parse(index))
            .toSet() ??
        {};
    _favoriteIndices.addAll(favoriteIndices);
  }

  void _saveFavoriteIndicesToSharedPreferences() {
    _prefs.setStringList('favorite_sites',
        _favoriteIndices.map((index) => index.toString()).toList());
  }

  Set<int> get favoriteIndices => _favoriteIndices;

  void toggleFavorite(int index) {
    if (_favoriteIndices.contains(index)) {
      _favoriteIndices.remove(index);
    } else {
      _favoriteIndices.add(index);
    }
    _saveFavoriteIndicesToSharedPreferences();
  }
}
