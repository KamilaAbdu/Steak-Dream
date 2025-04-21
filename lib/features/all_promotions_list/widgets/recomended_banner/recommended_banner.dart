import 'package:flutter/material.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/theme/app_dimens.dart';
import 'package:steak_dream/features/all_promotions/widgets/promotion_title.dart';
import 'package:steak_dream/features/all_promotions/widgets/recomended_banner/recommended_item_card.dart';

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
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              return const RecommendedItemCard(
                title: 'Салат',
                image: AppAssets.recommended,
                price: 1800,
                bonus: 45,
              );
            },
          ),
        ),
      ],
    );
  }
}
