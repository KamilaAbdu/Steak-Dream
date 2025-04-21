import 'package:steak_dream/features/cart/domain/entities/cart_item.dart';
import 'package:steak_dream/features/cart/domain/repositories/cart_repository.dart';

class AddToCart {
  final CartRepository repository;

  AddToCart(this.repository);

  Future<void> call(CartItem item) => repository.add(item);
}
