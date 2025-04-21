class Product {
  final String id;
  final String title;
  final String imageUrl;
  final int price;
  final int? oldPrice;

  const Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.oldPrice,
  });
}
