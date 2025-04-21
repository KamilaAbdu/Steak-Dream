import '../repositories/favorite_repository.dart';

class ToggleFavorite {
  final FavoriteRepository repository;

  ToggleFavorite(this.repository);

  Future<void> call(String productId) => repository.toggle(productId);
}
