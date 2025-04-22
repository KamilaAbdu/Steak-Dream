import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';
import 'package:steak_dream/features/cart/domain/entities/cart_item.dart';
import 'package:steak_dream/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:steak_dream/features/product/presentation/widgets/cart_dialog_bar.dart';
import '../../domain/entities/product_entity.dart';

class AddToCartButton extends StatelessWidget {
  final ProductEntity product;

  const AddToCartButton({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 30,
      child: OutlinedButton(
        onPressed: () {
          final cartItem = CartItem(
            productId: product.id,
            title: product.title,
            imageUrl: product.imageUrl,
            price: product.price,
            quantity: 1,
          );

          context.read<CartBloc>().add(AddItemToCart(cartItem));
          showCustomDialogBar(context, 'Товар добавлен в корзину');
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
            const Text('Добавить', style: AppTextStyles.productAddToCartButton),
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
