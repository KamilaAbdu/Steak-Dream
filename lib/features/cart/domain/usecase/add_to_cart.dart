import '../entities/cart_item.dart';
import '../repositories/cart_repository.dart';

class AddToCart {
  final CartRepository repository;
  AddToCart(this.repository);

  Future<void> call(CartItem item) => repository.add(item);
}
