// class SiteManager {
//   Set<int> _favoriteIndices = {};

//   Set<int> get favoriteIndices => _favoriteIndices;

//   void toggleFavorite(int index) {
//     if (_favoriteIndices.contains(index)) {
//       _favoriteIndices.remove(index);
//     } else {
//       _favoriteIndices.add(index);
//     }
//   }
// }

import 'package:shared_preferences/shared_preferences.dart';

class SiteManager {
  Set<int> _favoriteIndices = {};

  Set<int> get favoriteIndices => _favoriteIndices;

  // Constructor untuk menginisialisasi _favoriteIndices dari shared preferences
  SiteManager() {
    // Panggil fungsi untuk memuat favorit dari shared preferences saat objek dibuat
    _loadFavoriteIndices();
  }

  void toggleFavorite(int index) {
    if (_favoriteIndices.contains(index)) {
      _favoriteIndices.remove(index);
    } else {
      _favoriteIndices.add(index);
    }
    // Simpan perubahan ke shared preferences setelah setiap toggle favorit
    saveFavoriteIndices();
  }

  // Fungsi untuk menyimpan daftar situs favorit ke shared preferences
  void saveFavoriteIndices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favoriteIndices',
        _favoriteIndices.map((index) => index.toString()).toList());
  }

  // Fungsi untuk memuat daftar situs favorit dari shared preferences
  void _loadFavoriteIndices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteIndicesStr = prefs.getStringList('favoriteIndices');
    if (favoriteIndicesStr != null) {
      // Konversi dari List<String> ke Set<int>
      _favoriteIndices =
          favoriteIndicesStr.map((str) => int.parse(str)).toSet();
    }
  }

  // Fungsi untuk mendapatkan daftar situs favorit
  List<int> getFavoriteSites() {
    return _favoriteIndices.toList();
  }
}
