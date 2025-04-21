import 'package:shared_preferences/shared_preferences.dart';
import 'package:steak_dream/features/favorite/domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  static const _favoritesKey = 'favorites_ids';

  @override
  Future<void> toggle(String productId) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getStringList(_favoritesKey) ?? [];

    if (current.contains(productId)) {
      current.remove(productId);
    } else {
      current.add(productId);
    }

    await prefs.setStringList(_favoritesKey, current);
  }

  @override
  Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  @override
  Future<bool> isFavorite(String productId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_favoritesKey) ?? [];
    return favorites.contains(productId);
  }
}

