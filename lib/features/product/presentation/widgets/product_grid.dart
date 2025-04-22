import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:steak_dream/core/service/auto_router.dart';
import '../../domain/entities/product_entity.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductEntity> products;
  

  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    const cardWidth = 171.0;
    const cardHeight = 283.0;
    const spacing = 16.0;

    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = 16.0 * 2;
    final availableWidth = screenWidth - horizontalPadding;
    

    final count = (availableWidth + spacing) ~/ (cardWidth + spacing);
    final crossAxisCount = count.clamp(2, 4); 

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 8),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: cardWidth / cardHeight,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ProductCard(product: products[index]),
          onTap: () {
            context.router.push(
                        ProductDetailsRoute(entity: products[index]),
                      );
          },
          );
      },
    );
  }
}

