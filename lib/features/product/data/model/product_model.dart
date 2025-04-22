import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.price,
    super.oldPrice,
    super.bonus,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
  return ProductModel(
    id: json['id'] as String,
    title: json['title'] as String,
    imageUrl: json['image_url'] as String,
    price: json['price'] as int,
    oldPrice: json['old_price'] != null ? json['old_price'] as int : null,
    bonus: json['bonus'] != null ? json['bonus'] as int : null,

  );
}


  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'image_url': imageUrl,
    'price': price,
    'old_price': oldPrice,
    'bonus': bonus
  };
}
