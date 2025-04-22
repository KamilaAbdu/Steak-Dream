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

  CartItem copyWith({
    String? productId,
    String? title,
    String? imageUrl,
    int? quantity,
    int? price,
  }) {
    return CartItem(
      productId: productId ?? this.productId,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  int get total => quantity * price;
}
