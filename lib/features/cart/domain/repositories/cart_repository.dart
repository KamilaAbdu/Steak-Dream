import 'package:steak_dream/features/cart/domain/entities/cart_item.dart';

abstract class CartRepository {
  Future<void> add(CartItem item);
  Future<void> remove(String productId);
  Future<List<CartItem>> getItems();
}
