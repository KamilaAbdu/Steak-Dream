import 'package:flutter/material.dart';
import 'package:steak_dream/features/product/presentation/widgets/add_to_cart_button.dart';
import 'package:steak_dream/features/product/presentation/widgets/product_image_with_favorite.dart';
import 'package:steak_dream/features/product/presentation/widgets/product_info.dart';
import '../../domain/entities/product_entity.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 283,
      width: 171,
      child: Column(
        children: [
          ProductImageWithFavorite(product: product),
          ProductInfo(product: product),
          const SizedBox(height: 10),
          AddToCartButton(product: product),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
