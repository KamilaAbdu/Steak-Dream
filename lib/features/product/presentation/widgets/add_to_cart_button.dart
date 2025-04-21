import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';
import 'package:steak_dream/features/cart/domain/entities/cart_item.dart';
import 'package:steak_dream/features/cart/presentation/bloc/cart_bloc.dart';
import '../../domain/entities/product.dart';

class AddToCartButton extends StatelessWidget {
  final Product product;

  const AddToCartButton({required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 30,
      child: OutlinedButton(
        onPressed: () {
          context.read<CartBloc>().add(AddItemToCart(product as CartItem));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.orangeBackground,
              behavior: SnackBarBehavior.floating,
              content: const Text('Товар добавлен в корзину'),
            ),
          );
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          side: const BorderSide(color: Colors.white),
          padding: const EdgeInsets.symmetric(horizontal: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
