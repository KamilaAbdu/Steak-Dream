import 'package:flutter/material.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/theme/app_dimens.dart';
import 'package:steak_dream/features/all_promotions_list/widgets/popular_banner/popular_item_card.dart';
import 'package:steak_dream/features/all_promotions_list/widgets/promotion_title.dart';

class PopularBanner extends StatelessWidget {
  const PopularBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PromotionTitle(title: 'Популярное'),
        const SizedBox(height: AppDimens.mediumPadding),
        SizedBox(
          height: 269,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return const PopularItemCard(
                title: 'Стейк Стриплойн',
                image: AppAssets.popularBannerBG,
                price: 1800,
                oldPrice: 2000,
              );
            },
          ),
        ),
      ],
    );
  }
}

