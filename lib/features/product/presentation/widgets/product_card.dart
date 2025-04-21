import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';
import '../../domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 283,
      width: 171,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  product.imageUrl,
                  width: double.infinity,
                  height: 169,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 14,
                left: 14,
                child: Icon(
                  Icons.favorite,
                  color: AppColors.titleWhite,
                  size: 24,
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.orangeBackground,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${product.price}с',
                          style: AppTextStyles.productPrice.copyWith(),
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
          ),
          SizedBox(
            width: double.infinity,
            height: 30,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                side: const BorderSide(color: Colors.white),
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Добавить',
                    style: AppTextStyles.productAddToCartButton,
                  ),
                  const SizedBox(width: 6),
                  SvgPicture.asset(
                    AppAssets.cartItem,
                    width: 20,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
