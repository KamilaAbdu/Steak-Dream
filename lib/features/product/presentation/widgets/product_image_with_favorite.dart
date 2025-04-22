import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steak_dream/features/favorite/presentation/bloc/favorite_bloc.dart';
import '../../domain/entities/product_entity.dart';

class ProductImageWithFavorite extends StatelessWidget {
  final ProductEntity product;

  const ProductImageWithFavorite({required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Positioned(
          top: 14,
          left: 14,
          child: IconButton(
            onPressed: () {
              context.read<FavoriteBloc>().add(ToggleFavoriteEvent(product.id));
            },
            icon: BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, state) {
                final isFav = state is FavoriteLoaded && state.ids.contains(product.id);
                return Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.orange : Colors.white,
                  size: 24,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
