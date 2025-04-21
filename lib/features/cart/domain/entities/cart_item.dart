class CartItem {
  final String productId;
  final String title;
  final String imageUrl;
  final int quantity;
  final int price;

  CartItem({
    required this.productId,
    required this.title,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });

  int get total => quantity * price;
}
