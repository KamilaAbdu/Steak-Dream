import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';
import 'package:steak_dream/features/cart/domain/entities/cart_item.dart';
import 'package:steak_dream/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:steak_dream/features/product/presentation/widgets/cart_dialog_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopularItemCard extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int price;
  final int? oldPrice;

  const PopularItemCard({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358,
      height: 279,
      decoration: BoxDecoration(
        color: AppColors.backgraoundBlack,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imageUrl,
              height: 269,
              width: 358,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 269,
              width: 358,
              color: AppColors.blackTransparent40, 
            ),
          ),
          Positioned(
            top: 30,
            left: 18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.s20w600.copyWith(color: AppColors.white),
                ),
                const SizedBox(height: 69),
                Container(
                  height: 39,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '$price с',
                    style: AppTextStyles.s18w700.copyWith(
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
                if (oldPrice != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    '$oldPrice с',
                    style: AppTextStyles.s14w400.copyWith(
                      color: AppColors.white,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColors.white,
                    ),
                  ),
                ],
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    final cartItem = CartItem(
                      productId: id,
                      title: title,
                      imageUrl: imageUrl,
                      price: price,
                      quantity: 1,
                    );

                    context.read<CartBloc>().add(AddItemToCart(cartItem));
                    showCustomDialogBar(context, 'Товар добавлен в корзину');
                  },
                  child: Container(
                    width: 50,
                    height: 42,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppAssets.cartItem,
                        width: 30,
                        height: 30,
                        color: AppColors.titleWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
