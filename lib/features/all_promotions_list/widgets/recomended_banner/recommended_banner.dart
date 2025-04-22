import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steak_dream/core/service/auto_router.dart';
import 'package:steak_dream/core/theme/app_dimens.dart';
import 'package:steak_dream/features/all_promotions_list/widgets/promotion_title.dart';
import 'package:steak_dream/features/all_promotions_list/widgets/recomended_banner/recommended_item_card.dart';
import 'package:steak_dream/features/product/presentation/bloc/product_bloc.dart';

class RecommendedBanner extends StatelessWidget {
  const RecommendedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PromotionTitle(title: 'Рекомендуемое'),
        const SizedBox(height: AppDimens.mediumPadding),
        SizedBox(
          height: 269,
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoaded) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.products.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  separatorBuilder: (_, __) => const SizedBox(width: 14),
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return GestureDetector(
                      onTap: () {
                        context.router.push(ProductDetailsRoute(entity: product));
                      },
                      child: RecommendedItemCard(
                        title: product.title,
                        image: product.imageUrl,
                        price: product.price,
                        bonus: product.bonus, 
                      ),
                    );
                  },
                );
              } else if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Center(child: Text('Ошибка загрузки продуктов'));
              }
            },
          ),
        ),
      ],
    );
  }
}

