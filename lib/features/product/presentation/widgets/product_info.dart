import 'package:flutter/material.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';
import '../../domain/entities/product_entity.dart';

class ProductInfo extends StatelessWidget {
  final ProductEntity product;

  const ProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.orangeBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${product.price}с',
                    style: AppTextStyles.productPrice,
                  ),
                ),
                const SizedBox(width: 10),
                if (product.oldPrice != null)
                  Text(
                    '${product.oldPrice}с',
                    style: AppTextStyles.s14w400.copyWith(
                      decoration: TextDecoration.lineThrough,
                      color: AppColors.textGrey,
                      decorationColor: AppColors.textGrey,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              product.title,
              style: AppTextStyles.productTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
