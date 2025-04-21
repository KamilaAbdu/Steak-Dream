import 'package:steak_dream/features/cart/domain/entities/cart_item.dart';
import 'package:steak_dream/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final List<CartItem> _items = [];

  @override
  Future<void> add(CartItem item) async {
    final existing = _items.indexWhere((e) => e.productId == item.productId);
    if (existing >= 0) {
      _items[existing] = CartItem(
        productId: item.productId,
        title: item.title,
        imageUrl: item.imageUrl,
        quantity: _items[existing].quantity + 1,
        price: item.price,
      );
    } else {
      _items.add(item);
    }
  }

  @override
  Future<List<CartItem>> getItems() async => _items;

  @override
  Future<void> remove(String productId) async {
    _items.removeWhere((item) => item.productId == productId);
  }
}
