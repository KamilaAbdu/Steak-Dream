import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/service/auto_router.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';
import 'package:steak_dream/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:steak_dream/features/favorite/presentation/widgets/empty_favorite_view.dart';
import 'package:steak_dream/features/product/presentation/widgets/product_card.dart';
import 'package:steak_dream/features/product/presentation/bloc/product_bloc.dart';

@RoutePage()
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgraoundBlack,
      appBar: AppBar(
        backgroundColor: AppColors.backgraoundBlack,
        title: const Text("Избранные", style: AppTextStyles.mainHeader),
        leading: IconButton(
          icon: SvgPicture.asset(
            AppAssets.circleArrowBack,
            width: 26,
            color: AppColors.white,
          ),
          onPressed: () => context.router.push(PromotionsListRoute()),
        ),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, favState) {
          if (favState is FavoriteLoaded) {
            final favoriteIds = favState.ids;

            return BlocBuilder<ProductBloc, ProductState>(
              builder: (context, prodState) {
                if (prodState is ProductLoaded) {
                  final allProducts = prodState.products;
                  final favoriteProducts =
                      allProducts
                          .where((product) => favoriteIds.contains(product.id))
                          .toList();

                  if (favoriteProducts.isEmpty) {
                    return const EmptyFavoriteView();
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      itemCount: favoriteProducts.length,
                      padding: const EdgeInsets.only(top: 12),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.6,
                          ),
                      itemBuilder:
                          (_, index) =>
                              ProductCard(product: favoriteProducts[index]),
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            );
          }
          if (favState is FavoriteError) {
            return Center(child: Text(favState.message));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
