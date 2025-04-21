abstract class FavoriteRepository {
  Future<void> toggle(String productId);
  Future<List<String>> getFavorites();
  Future<bool> isFavorite(String productId);
}
