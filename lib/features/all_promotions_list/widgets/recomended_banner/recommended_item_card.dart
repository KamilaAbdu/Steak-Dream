import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:steak_dream/core/assets/app_assets.dart';
import 'package:steak_dream/core/theme/app_colors.dart';
import 'package:steak_dream/core/theme/app_text_styles.dart';

class RecommendedItemCard extends StatelessWidget {
  final String title;
  final String image;
  final int price;
  final int? bonus;

  const RecommendedItemCard({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    this.bonus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        color: AppColors.uiDarkGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              height: 130,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: AppTextStyles.s16w500.copyWith(color: AppColors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Text(
            '$priceс',
            style: AppTextStyles.s20w600.copyWith(color: AppColors.white),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.bonusItem,
                      height: 14,
                      width: 14,
                      color: AppColors.yellow,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        '+$bonus бонусов',
                        style: AppTextStyles.s14w400.copyWith(
                          color: AppColors.yellow,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.cartItem,
                    width: 20,
                    height: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
