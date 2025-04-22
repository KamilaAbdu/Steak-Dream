class ProductEntity {
  final String id;
  final String title;
  final String imageUrl;
  final int price;
  final int? oldPrice;
  final int? bonus;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.oldPrice,
    this.bonus
  });
}
